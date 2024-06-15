<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<FORM action="Delete.jsp" method="get">
<table>
<tr>
<th width="50%">Employee No:</th>
<td width="50%"><input type="text" name="eno"></td>
</tr>
<tr>
<td width="50%"><input type="submit" value="submit"></td>
</tr>
</table>
</FORM>
<%
int i=0;
try{
	String eno=request.getParameter("eno");
	int en=Integer.valueOf(eno);
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee","root","password");
	PreparedStatement ps = con.prepareStatement("delete from employee where eno=?");
	ps.setInt(1,en);
	i=ps.executeUpdate();
	con.close();
	out.println("<html><body><b>Successfully Deleted</b></body></html>");
	}catch(Exception ex){}
if(i>0)
	out.print("<h1>Data is deleted successfully</h1>");
	%>
</body>
</html>