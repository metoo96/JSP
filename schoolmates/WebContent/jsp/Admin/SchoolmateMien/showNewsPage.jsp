<%@ page language="java" import="java.util.*,com.schoolmates.model.*,java.lang.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
	<head>
	     <%
	    String path = request.getContextPath();
	
	    String basePath = request.getScheme() + "://"
	
	            + request.getServerName() + ":" + request.getServerPort()
	
	            + path + "/";
	     %>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Title Page</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css">
		<style type="text/css">
		</style>
	</head>
	<body>
	   <%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		 Integer currentPage = (Integer)request.getAttribute("page");
		 int previousPage = (currentPage-1);
		 int nextPage = (currentPage+1);
        %>
        
        <% for (int i = 0; i < newslist.size(); i++) {
               SchoolmateMien news = (SchoolmateMien)newslist.get(i);
        %>
		<div class="page-header">
			<h1>年级：<%=news.getGrade() %></h1>
			<h1>专业：<%=news.getSubject() %></h1>
			<h1>简介：<%=news.getDescription() %></h1>
		</div>

		<div align="center">
			<h1>
				<%=news.getName() %>
			</h1>
		</div>

		<div align="center" class="content" style=" margin-left: 10%;width:80%">
		<%
		     out.println(news.getContent());
		%>
		</div>
		<%} %>
		
	</body>
</html>