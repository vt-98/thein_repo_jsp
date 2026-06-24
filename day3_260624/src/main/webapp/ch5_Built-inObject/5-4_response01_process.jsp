<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <body>
  	<%
  		request.setCharacterEncoding("utf-8");
  		String userid=request.getParameter("id");
  		String password=request.getParameter("passwd");
  		
  		if (userid.equals("관리자") && password.equals("1234")) {
  			response.sendRedirect("5-4_response01_sucess.jsp");
  		} else {
  			response.sendRedirect("5-4_response01_failed.jsp");
  		}
  	%>
  </body>
</html>
