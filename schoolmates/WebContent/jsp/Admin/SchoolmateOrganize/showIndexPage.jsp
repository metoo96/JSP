<%@ page language="java" import="java.util.*,com.schoolmates.model.SchoolmateOrganize,java.lang.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

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
			.content img{
				margin-left: 5%;
				width: 90%;
			}
		</style>
	</head>
	<body>
         <%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
	     String firstIndexName =(String) request.getAttribute("firstIndexName");
        %>
        
        <% for (int i = 0; i < newslist.size(); i++) {
               SchoolmateOrganize organize = (SchoolmateOrganize)newslist.get(i);
        %>
		<div class="page-header">
			<h1>目录名称：<%=organize.indexTitle %></h1>
		</div>

		<div align="center">
			<h1>
				<%=organize.title %>
			</h1>
			<div>
				<p class="bg-warning" style="width: 90%;color:#999;line-height: 1.7em;">
					所属一级目录：<%=firstIndexName %>
				</p>
			</div>
		</div>

		<div align="center" class="content" style=" margin-left: 10%;width:80%">
			<%
			    out.println(organize.content);
			%>
		</div>
		
        <%} %>
	</body>
</html>