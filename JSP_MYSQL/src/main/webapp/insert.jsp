<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<font size = "+3" color = "green"><br>Welcome to Presidency University</font>
<form action="insert.jsp" method = "get">
<table>
<tr>
<th width = "50%">Employee No:</th>
<td width = "50%"><input type = "text" name = "eno"><td>
</tr>
<tr>
<th width = "50%">Employee Name:</th>
<td width = "50%"><input type = "text" name = "name"><td>
</tr>
<tr>
<th width = "50%">Employee Gender:</th>
<td width = "50%"><input type = "text" name = "gender"><td>
</tr>
<tr>
<th width = "50%">Employee Department:</th>
<td width = "50%"><input type = "text" name = "dept"><td>
</tr>
<tr>
<th width = "50%">Employee Salary:</th>
<td width = "50%"><input type = "text" name = "salary"><td>
</tr>
<tr>
<td width="50%"><input type="submit" value="submit"></td>
</tr>
</table>
<%
int i = 0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","password");
	PreparedStatement ps = con.prepareStatement("insert into employee values(?,?,?,?,?)");
	ps.setInt(1,Integer.valueOf(request.getParameter("eno")));
	ps.setString(2,request.getParameter("name"));
	ps.setString(3,request.getParameter("gender"));
	ps.setString(4,request.getParameter("dept"));
	ps.setFloat(5,Float.valueOf(request.getParameter("salary")));
	i = ps.executeUpdate();
	ps.close();
	con.close();
	
}
catch(Exception ex){
	
}
if (i>0)
	out.print("<h1>Data inserted successfully </h1>");
%>
</form>
</body>
</html>