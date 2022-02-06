<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*,com.hi.ScoreBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<style rel="stylesheet" type="text/css">
	#section>table{
		margin: 0 auto;
		text-align: center;
	}
</style>
<title>학생성적관리프로그램(ver0.10.0)</title>
</head>
<body>
	<%@include file="templete/header.jspf" %>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>삭제</th>
		</tr>
		<%
		request.setCharacterEncoding("utf-8"); 
		ArrayList<ScoreBean> list = new ArrayList<ScoreBean>();
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String driver = "oracle.jdbc.driver.OracleDriver";
		String sql = "select num,name,kor,eng,math from score order by num asc";
		String user = "scott";
		String password = "tiger";
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				ScoreBean bean = new ScoreBean();
				bean.setNum(rs.getInt(1));
				bean.setName(rs.getString(2));
				bean.setKor(rs.getInt(3));
				bean.setEng(rs.getInt(4));
				bean.setMath(rs.getInt(5));
				list.add(bean);
			}
		}finally{
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		}
		%>
		<%
		for(ScoreBean bean : list){
		%>
		<tr>
			<td><%= bean.getNum() %></td>
			<td><%= bean.getName() %></td>
			<td><%= bean.getKor() %></td>
			<td><%= bean.getEng() %></td>
			<td><%= bean.getMath() %></td>
			<td><form><a href="#"><input type="submit" name="num" value="X"></a></form></td>
		</tr>
		<% 
		}
		%>
	</table>
	<%@include file="templete/footer.jspf" %>
</body>
</html>