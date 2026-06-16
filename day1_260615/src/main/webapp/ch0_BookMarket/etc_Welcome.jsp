<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Welcome</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=book_2" />
    <link rel="stylesheet" href="./CSS/Welcome.css"/>
  </head>
  <body>
    <div class="contents">
      <header>
      <h1 class="logo">
        <a href="./Welcome.jsp" class="logo_main">
          <span class="material-symbols-outlined">book_2</span>
          <span class="home">HOME</span>
        </a>
      </h1>
      </header>
      
      <%!
      String greeting="Welcome to Book Shopping Mall";
      String tagline = "Welcome to Web Market!";
      %>
      
      <div class="container title">
        <div class="wrapper">
          <h1 class="display"><%= greeting %></h1>
          <p class="subtitle">BookMarket</p>
        </div>
      </div>
      
      <div class="container article">
        <h3><%= tagline %></h3>
      </div>
      
      <footer>
        &copy; BookMarket
      </footer>
    </div>
  <body>
</html>
