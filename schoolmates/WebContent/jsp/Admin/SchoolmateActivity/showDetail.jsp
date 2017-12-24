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
		<link rel="icon" href="<%=basePath %>res/favicon.icon">
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
        %>
        
		<div class="page-header">
			<h1>活动详情</h1>
		</div>
        
        <% for (int i = 0; i < newslist.size(); i++) {
                SchoolmateActivity news = (SchoolmateActivity)newslist.get(i);
                String htmlData = news.getContent();
        %>
        
		<div align="center">
			<h1>
				<%=news.getTitle() %>
			</h1>
			<div>
				<p class="bg-warning" style="width: 90%;color:#999;line-height: 1.7em;">
					作者：<%=news.getAuthor() %> 发布日期：<%=news.getDate() %> 
				</p>
			</div>
		</div>

		<div align="center" class="content" style=" margin-left: 10%;width:80%">
		<%
            out.println(htmlData);
        %>
		</div>
		<%} %>
			
	</body>
</html>