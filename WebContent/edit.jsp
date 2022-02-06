<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/index.css">
<style rel="stylesheet" type="text/css">
	#section table{
		margin: 0 auto;
	}
	#submit_reset{
		width:200px;
		margin: 0 auto;
		text-align: center;
	}
	#submit_reset input{
		width:97px;
		height:25px;
		margin-top:5px;
	}
	
</style>
<title>학생성적관리시스템(ver0.10.0)</title>
</head>
<body>
<%@include file="/templete/header.jspf" %>
	<form action="modify.jsp" method="post">
		<table>
			<tr>
				<td colspan="2"><input type="hidden" name="num" value="<%=request.getParameter("num")%>" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>국어</td> 
				<td><input type="text" name="kor" /></td>
			</tr>
			<tr>
				<td>영어</td>
				<td><input type="text" name="eng" /></td>
			</tr>
			<tr>
				<td>수학</td>
				<td><input type="text" name="math" /></td>
			</tr>
		</table>
		<div id="submit_reset">
			<a href="#"><input type="submit" value="입력"/></a>
			<a href="#"><input type="reset" value="취소"/></a>
		</div>
	</form>
<%@include file="/templete/footer.jspf" %>
</body>
</html>