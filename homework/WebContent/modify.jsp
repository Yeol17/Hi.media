<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.hi.ScoreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");
String name = request.getParameter("name");
String kor = request.getParameter("kor");
String eng = request.getParameter("eng");
String math = request.getParameter("math");
System.out.println(num);
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "scott";
String password = "tiger";
String driver = "oracle.jdbc.driver.OracleDriver";
String sql = "update score set name='"+name+"',kor="+kor+",eng="+eng+",math="+math+" where num="+num;
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

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
</body>
</html>