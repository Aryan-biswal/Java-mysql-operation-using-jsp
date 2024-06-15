<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display</title>
</head>
<body>
<h2>Employee Details</h2>
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","password");
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from employee");
	%>
	<table>
	<tr><th>E.No</th><th>Name</th><th>Gender</th><th>Department</th><th>Salary</th></tr>
	<%
	while(rs.next()){
	%>
	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getFloat(5) %></td>	
	</tr>
	<% } 
	rs.close();
	st.close();
	con.close();
} catch(Exception ex){}
	%>
	</table>
	<form action="display.jsp" method="get">
	</form>
</body>
</html>