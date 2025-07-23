<%@ page import="java.sql.*, java.util.*" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    List<String> tableList = new ArrayList<>();
    String selectedTable = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");

        stmt = conn.createStatement();
        rs = stmt.executeQuery("SHOW TABLES");

        while (rs.next()) {
            tableList.add(rs.getString(1));
        }

        String defaultTable = tableList.size() > 0 ? tableList.get(new Random().nextInt(tableList.size())) : null;
        selectedTable = request.getParameter("selectedTable");
        if (selectedTable == null && defaultTable != null) {
            selectedTable = defaultTable;
        }

        ResultSet dataResult = null;
        if (selectedTable != null) {
            dataResult = stmt.executeQuery("SELECT * FROM " + selectedTable);
            request.setAttribute("data", dataResult);
        }

        request.setAttribute("tableList", tableList);
        request.setAttribute("selectedTable", selectedTable);
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Home Page - Table Viewer</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url("https://img.pikbest.com/wp/202344/high-tech-texture-futuristic-circuit-board-abstract-background-with-technological_9925654.jpg!sw800") no-repeat center center fixed;
            background-size: cover;
            color: #fff;
        }

        .container {
            padding: 40px;
            background-color: rgba(0, 0, 0, 0.75);
            margin: 40px auto;
            width: 90%;
            border-radius: 12px;
            box-shadow: 0 0 25px rgba(0, 255, 255, 0.4);
        }

        h2 {
            text-align: center;
            color: #00ffe5;
            text-shadow: 0 0 10px #00ffe5;
        }

        form {
            text-align: center;
            margin-top: 20px;
        }

        select {
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            border: none;
            background-color: #111;
            color: #00ffe5;
            box-shadow: 0 0 5px #00ffe5;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 30px;
            background-color: rgba(255, 255, 255, 0.05);
            color: #fff;
        }

        th, td {
            padding: 12px 18px;
            border: 1px solid #00ffe5;
            text-align: center;
        }

        th {
            background-color: rgba(0, 255, 255, 0.2);
            font-weight: bold;
        }

        .actions a {
            color: #00ffe5;
            text-decoration: none;
            margin-right: 12px;
            transition: color 0.3s ease;
        }

        .actions a:hover {
            color: #ff4081;
        }

        .add-record {
            display: block;
            text-align: center;
            margin-top: 25px;
        }

        .add-record a {
            background-color: #00ffe5;
            padding: 10px 20px;
            color: #000;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            box-shadow: 0 0 12px #00ffe5;
            transition: background-color 0.3s ease;
        }

        .add-record a:hover {
            background-color: #ff4081;
            color: #fff;
            box-shadow: 0 0 12px #ff4081;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Welcome! Select a table to manage:</h2>

    <form method="get" action="Home.jsp">
        <label>Select Table:</label>
        <select name="selectedTable" onchange="this.form.submit()">
            <% for (String table : tableList) {
                   String sel = table.equals(selectedTable) ? "selected" : "";
            %>
                <option value="<%=table%>" <%=sel%>><%=table%></option>
            <% } %>
        </select>
    </form>

    <%
        ResultSet data = (ResultSet) request.getAttribute("data");
        if (data != null) {
            ResultSetMetaData meta = data.getMetaData();
            int columnCount = meta.getColumnCount();
    %>
        <table>
            <tr>
                <% for (int i = 1; i <= columnCount; i++) { %>
                    <th><%= meta.getColumnName(i) %></th>
                <% } %>
                <th>Actions</th>
            </tr>
            <% while (data.next()) { %>
            <tr>
                <% for (int i = 1; i <= columnCount; i++) { %>
                    <td><%= data.getString(i) %></td>
                <% } %>
                <td class="actions">
                    <a href="EditServlet?table=<%=selectedTable%>&id=<%=data.getString(1)%>">Edit</a>
                    <a href="DeleteServlet?table=<%=selectedTable%>&id=<%=data.getString(1)%>">Delete</a>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="add-record">
            <a href="Add.jsp?table=<%=selectedTable%>"> Add New Record</a>
        </div>
    <%
        } else {
    %>
        <p style="text-align:center; margin-top: 30px;">No table selected or data available.</p>
    <%
        }
    %>
</div>

</body>
</html>
