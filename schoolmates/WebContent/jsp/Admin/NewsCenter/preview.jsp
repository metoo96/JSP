<%@ page language="java" contentType="text/html; charset=utf-8"
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
		<title>预览preview</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/newsCenterStyle.css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" width="1009">
		<%
		    //处理乱码
		    request.setCharacterEncoding("UTF-8");
		    String title = request.getParameter("title");
		    String content = request.getParameter("content");
		    String form = request.getParameter("form");
		%>
		<div id="newsCenter" class="content news-center-content ">
			<div class="mainPage newsCenter">
				<div>
					<div class="new-head">
						<div class="title">
							新闻中心
						</div>
						<div class="border-hr">
							
						</div>
					</div>

					<div class="detail-content">
						<div class="title" align="center">
							<%=title %>
						</div>
						<div class="sub-title">
							来源:<%=form %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击数:
						</div>
						<div class="content">
							<%=content %>
						</div>
					</div>

				</div>
			</div>
		</div>
	</body>
</html>