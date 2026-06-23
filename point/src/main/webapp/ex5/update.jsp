<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.trim().isEmpty()) {
        response.sendRedirect("list.jsp");
        return;
    }
    int id = Integer.parseInt(idParam);
    
    String method = request.getMethod();

    String url    = "jdbc:postgresql://localhost:5432/hrd";
    String dbUser = "postgres";
    String dbPass = "1234";

    // POST로 요청이 들어왔을 때 (수정 완료 처리)
    if ("POST".equals(method)) {
        String title   = request.getParameter("title");
        String content = request.getParameter("content");
        String author  = request.getParameter("author");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, dbUser, dbPass);

            String sql = "UPDATE board SET title = ?, content = ?, author = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, author);
            pstmt.setInt(4, id);
            pstmt.executeUpdate();

            response.sendRedirect("view.jsp?id=" + id);
            return;

        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn  != null) try { conn.close();  } catch(Exception e) {}
        }
    }

    // GET 요청일 때 (기존 데이터 조회해서 폼에 뿌려주기)
    String title = "";
    String content = "";
    String author = "";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);

        String sql = "SELECT title, content, author FROM board WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
            author = rs.getString("author");
        } else {
            response.sendRedirect("list.jsp");
            return;
        }
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    } finally {
        if (rs    != null) try { rs.close();    } catch(Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if (conn  != null) try { conn.close();  } catch(Exception e) {}
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>

<jsp:include page="header.jsp"/>

<h2>글 수정</h2>

<form method="post">
    제목   : <input type="text" name="title" value="<%= title %>" style="width:400px"><br><br>
    작성자 : <input type="text" name="author" value="<%= author %>"><br><br>
    내용   : <textarea name="content" rows="8" cols="60"><%= content %></textarea><br><br>
    <input type="submit" value="수정 완료">
    <a href="view.jsp?id=<%= id %>">취소</a>
</form>

</body>
</html>
