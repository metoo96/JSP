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
		<script type="text/javascript" src="<%=basePath %>js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="page-header">
	   <%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		 Integer currentPage = (Integer)request.getAttribute("page");
		 int previousPage = (currentPage-1);
		 int nextPage = (currentPage+1);
        %>
		  <h1>校友期刊模块</h1>
		</div>

		<div align="right" style="margin-bottom: 1em">
			<a href="<%=basePath %>jsp/Admin/SchoolmatePublish/addPublish.jsp" type="button" class="btn btn-primary">发布期刊</a>
		</div>

         <div align="center">
				<!-- 判断是否还有内容 -->
		        <% if(newslist.size() == 0){%>
			           <h4 style="color:red;">已经是最后一页了~~</h4>
			    <% }%>
		</div>
   
		<ul class="list-group">
		      
		        <% for (int i = 0; i < newslist.size(); i++) {
		               SchoolmatePublish news = (SchoolmatePublish)newslist.get(i);
		        %>
				<a href="#">
				  <li class="list-group-item listItems">
				  	<div class="row">
					  <div class="col-xs-7 col-sm-7 col-md-7">
					  	<div style="width: 90%;margin-left: 5%">
						 期刊标题： <%=news.getTitle() %>
					  	</div>
					  </div>
					  <div class="col-xs-5 col-sm-5 col-md-5" align="right">
					 
					  	<% if ((news.getDownload_url()).equals("default")) { %>
							<a href="/schoolmates/SchoolmatePublish/setContent?id=<%=news.getId()%>" class="btn btn-warning">设置内容</a>
						<%} else { %>
							<a href="/schoolmates/SchoolmatePublish/setContent?id=<%=news.getId()%>" class="btn btn-primary">修改内容</a>
					    <%} %>
					 
					  	<% if ((news.getHead_image()).equals("default")) { %>
							<a href="/schoolmates/SchoolmatePublish/setHeadImage?id=<%=news.getId()%>" class="btn btn-warning">设置封面</a>
						<%} else { %>
							<a href="/schoolmates/SchoolmatePublish/setHeadImage?id=<%=news.getId() %>" class="btn btn-primary">修改封面</a>
					  	<%} %>
					  	<a type="button" href="/schoolmates/SchoolmatePublish/editDetail?id=<%=news.getId() %>" class="btn btn-primary">修改</a>
					  	<a type="button" onclick="delNews(<%=news.getId() %>)" class="btn btn-danger">删除</a>
					  </div>
					</div>
				  </li>
			  </a>
		    <%} %>
		</ul>
         
         
         
         <div align="center">
			<nav>
			  <ul class="pagination">
			      <% if (currentPage != 1) { %>
				    <li>
				      <a href="/schoolmates/SchoolmatePublish/index?page=<%=previousPage%>" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				    <%} %>
	
			         <li class="active"><a href="/schoolmates/SchoolmatePublish/index?page=<%=currentPage%>"><%=currentPage%></a></li>
			 
				    <li>
				      <a href="/schoolmates/SchoolmatePublish/index?page=<%=nextPage%>" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				    </li>
			  </ul>
			</nav> 
		</div>
	</body>

	<script type="text/javascript">
		var delNews = function(id){
			if(confirm("是否确定删除？")){
				$.ajax({
					url:"/schoolmates/SchoolmatePublish/delNews",
					type:'post',
					data:{id:id},
					success:function(res){
						console.log(res);
						if(res == "ok"){
							alert("删除成功");
							window.location.reload();
						}else {
							alert("删除失败");
						}
					},
					error:function(err){
						console.log(err);
						alert('网络错误')
					}
				})
			}
		}
	</script>
</html>