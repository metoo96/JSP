<%@ page language="java" import="java.util.*,com.schoolmates.model.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
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
        %>
        
		<div class="page-header">
			<h1>校友服务内容</h1>
		</div>
		
        <% for (int i = 0; i < newslist.size(); i++) {
                SchoolmateServer news = (SchoolmateServer)newslist.get(i);
                String htmlData = news.getContent();
                String Data = htmlspecialchars(htmlData);
        %>
		<div align="center">
			<h1>
			   <%=news.getTitle() %>
			</h1>
			<div>
				<p class="bg-warning" style="width: 90%;color:#999;line-height: 1.7em;">
					作者：<%=news.getAuthor() %> 发布日期：<%=news.getDate() %> 发布时间：<%=news.getTime() %>
				</p>
			</div>
		</div>

		<div align="center" id="content" class="content" style=" margin-left: 10%;width:80%;">
		<%
            out.println(htmlData);
        %>
		</div>
		<div align="center" id="content1" class="content1" style=" margin-left: 10%;width:80%">
		</div>
		
		<%} %>
		
		 <%!
		    private String htmlspecialchars(String str) {
			str = str.replaceAll("&", "&amp;");
			str = str.replaceAll("<", "&lt;");
			str = str.replaceAll(">", "&gt;");
			str = str.replaceAll("\"", "&quot;");
			return str;
		    }
	    %>
	    
         
    </div>
    <script type="text/javascript" src="<%=basePath %>js/jquery-2.2.4.min.js"></script>
    <script>
     //   $('#content1').html("#content");//通过html()方法将数据输出到div中
    </script>

	</body>
</html>