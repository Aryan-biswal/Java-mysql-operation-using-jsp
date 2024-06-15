<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<FORM action="Update.jsp" method="get">
<table>
<tr>
<th width="50%">Employee No:</th>
<td width="50%"><input type="text" name="eno"></td>
</tr>
<tr>
<th width="50%">Employee Name:</th>
<td width="50%"><input type="text" name="ename"></td>
</tr>
<tr>
<td width="50%"><input type="submit" value="submit"></td>
</tr>
</table>
</FORM>
<%
    int i = 0;
    try {
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "password");
            PreparedStatement ps = con.prepareStatement("update employee set ename=? where eno=?");
            ps.setString(1, request.getParameter("ename"));
            ps.setInt(2, Integer.valueOf(request.getParameter("eno")));
            i = ps.executeUpdate();
            ps.close();
            con.close();
            out.println("<html><body><b>Successfully Updated</b></body></html>");
        
    } catch (Exception ex) {
        
    }
    if (i > 0)
        out.print("<h1>Data is updated successfully</h1>");
    %>

</body>
</html>