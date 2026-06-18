<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>방명록</title>
  </head>
  <body>
  	<h2>방명록</h2>
  	
  	<!-- 글 작성 폼 -->
  	<!-- 강사님 예제 기존 -->
  	<!-- <form action="save.jsp" method="post">
  		이 름: <input type="text" name="name"> <br>
  		메시지: <textarea name="message" rows="3" cols="40"></textarea> <br>
  		<input type="submit" value="저장하기">
  	</form> -->
  	
  	<!-- css 멕이기 -->
  	<form action="save.jsp" method="post" style="max-width: 450px;">
	    <div style="display: flex; align-items: center; margin-bottom: 10px;">
	        <label style="width: 60px; font-weight: bold;">이  름 </label>
	        <input type="text" name="name" style="flex: 1; padding: 5px;">
	    </div>
	    
	    <div style="display: flex; align-items: flex-start; margin-bottom: 10px;">
	        <label style="width: 60px; font-weight: bold; margin-top: 5px;">메시지 </label>
	        <textarea name="message" rows="3" style="flex: 1; padding: 5px; resize: none;"></textarea>
	    </div>
	    
	    <div style="display: flex; justify-content: flex-end; margin-bottom: 10px;">
	        <input type="submit" value="저장하기" style="padding: 5px 15px; cursor: pointer;">
	    </div>
	</form>
  	
  	<hr>
  	
  	<!--  DB에서 목록 불러오기 -->
  	<%
  	String url = "jdbc:postgresql://localhost:5432/guestbook";
  	String dbUser = "postgres";
  	String dbPass = "1234";
  	
  	Connection conn = null;
  	Statement stmt = null;
  	ResultSet rs = null;
  	
  	try {
  		Class.forName("org.postgresql.Driver");
  		conn = DriverManager .getConnection(url, dbUser, dbPass);
  		stmt = conn.createStatement();
  		rs = stmt.executeQuery("SELECT * FROM guestbook ORDER BY id DESC");
  		
  		while (rs.next()) {
  			%>
  			<div style="border:1px solid #ccc; margin:10px; padding:10px">
  				<b><%= rs.getString("name") %></b>
  				<span style="color:gray; font-size:0.9em"><%= rs.getTimestamp("reg_date") %></span> <br>
  				<%= rs.getString("message") %>
  			</div>
  			<%
  		}
  	} catch (Exception e) {
  		out.println("<p>오류: " + e.getMessage() + "</p>");
  	} finally {
  		if (rs != null) try {rs.close();} catch(Exception e) {}
  		if (stmt != null) try {stmt.close();} catch(Exception e) {}
  		if (conn != null) try {conn.close();} catch(Exception e) {}
  	}
  	%>
  	
  	
  	
  	
  	
  	
  	
  </body>
</html>
