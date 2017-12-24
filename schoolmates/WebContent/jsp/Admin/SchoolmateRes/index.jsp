<%@ page language="java" import="java.util.*,com.schoolmates.model.News,java.lang.*" contentType="text/html; charset=UTF-8"
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
		<%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		 Integer currentPage = (Integer)request.getAttribute("page");
		 int previousPage = (currentPage-1);
		 int nextPage = (currentPage+1);
        %>
		<div class="page-header">
		  <h1>校园资源共享模块</h1>
		</div>

		<div align="right" style="margin-bottom: 1em">
			<a href="<%=basePath%>jsp/Admin/SchoolmateRes/addNewsPage.jsp" type="button" class="btn btn-primary">发布新闻</a>
		</div>
		<div align="center" style="margin-bottom: 1em">
		<!-- 判断是否还有内容 -->
        <% if(newslist.size() == 0){%>
	           <h4 style="color:red;">已经是最后一页了~~</h4>
	    <% }%>
	    </div>
        <% for (int i = 0; i < newslist.size(); i++) {
                News news = (News)newslist.get(i);
        %>
		<ul class="list-group">
				<a  href="/schoolmates/SchoolmateRes/showNewsPage?newsID=<%=news.getNewsID()%>">
				  <li class="list-group-item listItems">
				  	<div class="row">
					  <div class="col-xs-10 col-sm-10 col-md-10">
					  	<font style="color:#666">
					  		<%=news.getDate()%> <%=news.getTime() %> 作者 <%=news.getForm() %>
					  	</font>
					  	<div style="width: 90%;margin-left: 5%">
					
					         <%=news.getTitle() %>
						    
					  	</div>
					    
					  </div>
					  <div class="col-xs-2 col-sm-2 col-md-2" align="right">
					  	<a type="button" href="/schoolmates/SchoolmateRes/editNews?newsID=<%=news.getNewsID() %>" class="btn btn-primary">修改</a>
					  	<a type="button" onclick="delNews(<%=news.getNewsID() %>)" class="btn btn-danger">删除</a>
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
				      <a href="/schoolmates/SchoolmateRes/index?page=<%=previousPage%>" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				    <%} %>
	
			         <li class="active"><a href="/schoolmates/SchoolmateRes/index?page=<%=currentPage%>"><%=currentPage%></a></li>
			 
				    <li>
				      <a href="/schoolmates/SchoolmateRes/index?page=<%=nextPage%>" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				    </li>
			  </ul>
			</nav> 
		</div>
		
		<script type="text/javascript">
			
			function delNews(newsID){
				var data = {
					newsID : newsID
				};
				if(confirm("您确定要删除该条信息吗？")){
					$.ajax({
						url:"/schoolmates/SchoolmateRes/delNews",
						data:data,
						type:"POST",
						success:function(res){
						
							if(res == "ok"){
								alert("删除成功");
								window.location.reload();
							}else {
								alert("删除失败");
							}
						},
						error:function(){
							alert('网络错误');
						}
					})
				}
			}

		</script>
	</body>
</html>