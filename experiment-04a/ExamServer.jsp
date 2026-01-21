<%@ page contentType="text/html" language="java" import="java.sql.*" %>
<html>
<head>
    <title>Online Exam Server</title>
    <style>
        body {
            background-color: black;
            font-family: courier;
            color: blue;
        }
    </style>
</head>

<body>
<h2 align="center">ONLINE EXAMINATION</h2>
<a href="ExamClient.html">Back To Main Page</a>
<hr/>

<%
String ans1 = request.getParameter("ans1");
String ans2 = request.getParameter("ans2");
String ans3 = request.getParameter("ans3");

int mark = 0;

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con = DriverManager.getConnection("jdbc:odbc:examDS");
Statement stmt = con.createStatement();

ResultSet rs = stmt.executeQuery("SELECT * FROM examTab");

int i = 1;
while (rs.next()) {
    if (i == 1 && ans1.equals(rs.getString(1))) {
        mark += 5;
    }
    if (i == 2 && ans2.equals(rs.getString(1))) {
        mark += 5;
    }
    if (i == 3 && ans3.equals(rs.getString(1))) {
        mark += 5;
    }
    i++;
}

if (mark >= 10) {
    out.println("<h4>Your Mark is : " + mark + "</h4>");
    out.println("<h3>Congratulations! You are eligible for the next round.</h3>");
} else {
    out.println("<h4>Your Mark is : " + mark + "</h4>");
    out.println("<h3>Sorry! You are not eligible for the next round.</h3>");
}

con.close();
%>

</body>
</html>
