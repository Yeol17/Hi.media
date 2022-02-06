<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<style rel="stylesheet" type="text/css">

</style>
<title>학생성적관리프로그램(ver0.10.0)</title>
</head>
<body>
<%@include file="/templete/header.jspf" %>
<%@page import="java.sql.*,java.util.*" %>
<%
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String name = request.getParameter("name");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String password = "tiger";
String driver = "oracle.jdbc.driver.OracleDriver";
String sql = "insert into score values ("+num+",'"+name+"',"+kor+","+eng+","+math+")";
System.out.println(sql);
Connection conn = null;
Statement stmt = null;

try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url,user,password);
	stmt = conn.createStatement();
	stmt.executeUpdate(sql);
}finally{
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();	
}
response.sendRedirect("list.jsp");
%>
<%@include file="/templete/footer.jspf" %>
</body>
</html>