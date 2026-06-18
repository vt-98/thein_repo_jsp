<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  	<!-- 단계: 1 -->
  	Index JSP 안녕
  	<!-- 단계: 2 -->
  	<h2>JSP 개발환경 구축 완료!</h2>
  	
  	<%
  	String name = "JDK21 + Eclipse EE";
  	%>
  	
  	<!-- 단계: 3 -->
  	
  	<h2>이름을 입력하세요</h2>
  	<form action="hello.jsp" method="get">
  		이름: <input type="text" name="username" placeholder="이름을 입력하세요"/>
  		<input type="submit" value="인사하기"/>
  	</form>
  	
  	
  </body>
</html>
