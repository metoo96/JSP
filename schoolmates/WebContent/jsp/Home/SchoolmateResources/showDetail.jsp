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
		<title>新闻详情</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/newsCenterStyle.css">
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" width="1009">
		 <%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		
         %>
		<div id="newsCenter" class="content news-center-content ">
			<div class="mainPage newsCenter">
				<div>
					<div class="new-head">
						<div class="title">
							校友资源
						</div>
						<div class="border-hr">
							
						</div>
					</div>

					<div class="detail-content">
					   <!-- 判断是否还有内容 -->
		              <% if(newslist.size() == 0){%>
			           <h4 style="color:red;">已经是最后一页了~~~~~~</h4>
			          <% }%>
					   <% for (int i = 0; i < newslist.size(); i++) {
                         News news = (News)newslist.get(i);
                        %>
						<div class="title" align="center">
							
						</div>
						<div class="sub-title">
							来源:<%=news.getForm() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发布时间:<%=news.getDate() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击数:
						</div>
						<div class="content">
							<%
							    out.println(news.getContent());
							%>
						</div>
						<%} %>
					</div>
					
				</div>
			</div>
		</div>
	</body>
</html>