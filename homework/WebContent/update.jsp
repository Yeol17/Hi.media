<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.hi.ScoreBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<style rel="stylesheet" type="text/css">
	#section div{
		width:150px;
		text-align: center;
		margin:0 auto;
	}
	#section div>p{
		float: left;
	}
	#section div>select{
		width:50px;
	}
	#section div>input[type=submit]{
		clear:both;
		width:100px;
		margin-top:10px;
	}
	
</style>
<title>학생성적관리프로그램(ver0.10.0)</title>
</head>
<body>
<%@include file="templete/header.jspf" %>
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
		list.add(bean);
	}
}finally{
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
	if(conn!=null)conn.close();
}

%>
	<form action="edit.jsp">
		<div>
			<p>수정할 학번</p>
			<select name="num">
				<%
				for(ScoreBean bean : list){	
				%>
					<option value="<%=bean.getNum()%>"><%=bean.getNum()%></option>
				<%
				}
				%>
			</select>
			<input type="submit" value="수정하기" />
		</div>
	</form>
<%@include file="templete/footer.jspf" %>
</body>
</html>