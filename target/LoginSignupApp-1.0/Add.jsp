<%@ page import="java.sql.*" %>
<%
    String table = request.getParameter("table");
    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " LIMIT 1");
    ResultSetMetaData meta = rs.getMetaData();
%>
<html>
<body>
    <h2>Add New Record to <%=table%></h2>
    <form action="InsertServlet" method="post">
        <input type="hidden" name="table" value="<%=table%>"/>
        <%
            for (int i = 2; i <= meta.getColumnCount(); i++) {
        %>
            <label><%= meta.getColumnName(i) %></label>
            <input type="text" name="<%= meta.getColumnName(i) %>" /><br/>
        <%
            }
        %>
        <input type="submit" value="Add Record"/>
    </form>
</body>
</html>
