<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
    <h2>Scripting Tag</h2>
    	
    <%!
    // 자바구문 선언부
    int count = 3;
    
    String makeItLower(String data) {
      return data.toLowerCase();
    }
    %>
    
    <%
    // 자바구문 구현부
    for(int i=1; i <= count; i++) {
      out.println("Java Server Pages " + i + ".<br>");
    }
    %>
    
    <%=
    // 값 출력
    makeItLower("Hello World")
    %>
	
	
  </body>
</html>
