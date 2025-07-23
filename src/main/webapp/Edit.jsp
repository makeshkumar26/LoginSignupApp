<%@ page import="java.sql.*" %>
<%
    String table = request.getAttribute("table").toString();
    String id = request.getAttribute("id").toString();

    Class.forName("org.mariadb.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3310/mysql", "root", "root");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM " + table + " WHERE " + table + ".id = " + id);
    ResultSetMetaData meta = rs.getMetaData();
    rs.next();
%>
<html>
<body>
    <h2>Edit Record in <%=table%></h2>
    <form action="UpdateServlet" method="post">
        <input type="hidden" name="table" value="<%=table%>"/>
        <input type="hidden" name="id" value="<%=id%>"/>
        <%
            for (int i = 2; i <= meta.getColumnCount(); i++) {
                String col = meta.getColumnName(i);
        %>
            <label><%=col%></label>
            <input type="text" name="<%=col%>" value="<%=rs.getString(col)%>"/><br/>
        <%
            }
        %>
        <input type="submit" value="Update"/>
    </form>
</body>
</html>
