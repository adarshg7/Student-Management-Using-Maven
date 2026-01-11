<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Student List</title>
</head>
<body>

<h1>Student List</h1>

<table border="1" cellpadding="8">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Department</th>
        <th>Year</th>
        <th>Email</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/college_db?useSSL=false&serverTimezone=UTC",
            "root", "6");

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM student");

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("department") %></td>
        <td><%= rs.getInt("year") %></td>
        <td><%= rs.getString("email") %></td>
    </tr>
<%
        }
        con.close();
    } catch (Exception e) {
        out.println(e);
    }
%>

</table>

<br>
<a href="index.jsp">Add New Student</a>

</body>
</html>
