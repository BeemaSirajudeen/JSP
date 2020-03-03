<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String s=request.getParameter("name");
String st=request.getParameter("pss");
String sql="Select * from lgn";
Class.forName("com.mysql.jdbc.Driver");  	
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","");
	Statement st1=con.createStatement();
	ResultSet rs=st1.executeQuery(sql);
	while(rs.next())
     {
		String user=rs.getString("username");
		String pswd=rs.getString("password");
		String typead=rs.getString("type");
		if(user.equals(s) && pswd.equals(st) && typead.equals("a"))
		{
          session.setAttribute("name", user);
          response.sendRedirect("admin.jsp");
		}
		else if(user.equals(s) && pswd.equals(st) && typead.equals("u"))
		{
			session.setAttribute("name", user);
			response.sendRedirect("user.jsp");
	    }
	 }
	 %>
</body>
</html>