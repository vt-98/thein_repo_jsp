<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="rsrc6.DTOBook" %>
<%@ page import="rsrc6.DAOBookRepository" %>

<%
	request.setCharacterEncoding("utf-8");

	String bookId = request.getParameter("bookId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String author = request.getParameter("author");
	String description = request.getParameter("description");
	String publisher = request.getParameter("publisher");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String releaseDate = request.getParameter("releaseDate");
	String condition = request.getParameter("condition");
	
	int price;
	if (unitPrice.isEmpty())
		price=0;
	else
		price=Integer.valueOf(unitPrice);

	long stock;
	if (unitPrice.isEmpty())
		stock=0;
	else
		stock=Long.valueOf(unitsInStock);
	
	DAOBookRepository dao = DAOBookRepository.getInstance();
	
	DTOBook newBook = new DTOBook();
	newBook.setBookId(bookId);
	newBook.setName(name);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setDescription(description);
	newBook.setPublisher(publisher);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setReleaseDate(releaseDate);
	newBook.setCondition(condition);
	
	dao.addBook(newBook);
	
	response.sendRedirect("./books.jsp");
%>
	    