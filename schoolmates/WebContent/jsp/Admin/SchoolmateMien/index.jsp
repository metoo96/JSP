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
		  <h1>校友风采模块</h1>
		</div>

		<div align="right" style="margin-bottom: 1em">
			<a href="<%=basePath %>jsp/Admin/SchoolmateMien/addMien.jsp" type="button" class="btn btn-primary">发布人物</a>
		</div>
		
		<div align="center" style="margin-bottom: 1em">
		<!-- 判断是否还有内容 -->
        <% if(newslist.size() == 0){%>
	           <h4 style="color:red;">已经是最后一页了~~</h4>
	    <% }%>
	    </div>
        <% for (int i = 0; i < newslist.size(); i++) {
               SchoolmateMien news = (SchoolmateMien)newslist.get(i);
        %>
        
		<ul class="list-group">
			<volist name="news" id="news">
				<a  href="/schoolmates/SchoolmateMien/showNewsPage?id=<%=news.getId()%>">
				  <li class="list-group-item listItems">
				  	<div class="row">
					  <div class="col-xs-7 col-sm-7 col-md-7">
					  	<font style="color:#666">
					  		<%=news.getGrade() %>级 <%=news.getSubject()%>专业 <%=news.getName() %>：
					  	</font>
					  	<div style="width: 90%;margin-left: 5%">
						   
						    <%=news.getDescription() %>
					  	</div>
					    
					  </div>
					  <div class="col-xs-5 col-sm-5 col-md-5" align="right">
					  	<% if (news.getHead_url().equals("default")){ %>
							<a href="/schoolmates/SchoolmateMien/setHeadImage?id=<%=news.getId() %>" class="btn btn-warning">设置首页图像</a>
						<%}else{ %>
							<a href="/schoolmates/SchoolmateMien/setHeadImage?id=<%=news.getId() %>" class="btn btn-primary">修改首页图像</a>
					  	<%} %>
					  	<a type="button" href="/schoolmates/SchoolmateMien/editMien?id=<%=news.getId() %>" class="btn btn-primary">修改</a>
					  	<a type="button" onclick="delNews(<%=news.getId() %>)" class="btn btn-danger">删除</a>
					  </div>
					</div>
				  </li>
			  </a>
		    </volist>
		</ul>
		<%} %>
        
        
		<div align="center">
			<nav>
			  <ul class="pagination">
			      <% if (currentPage != 1) { %>
				    <li>
				      <a href="/schoolmates/SchoolmateMien/index?page=<%=previousPage%>" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				    <%} %>
	
			         <li class="active"><a href="/schoolmates/SchoolmateMien/index?page=<%=currentPage%>"><%=currentPage%></a></li>
			 
				    <li>
				      <a href="/schoolmates/SchoolmateMien/index?page=<%=nextPage%>" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				    </li>
			  </ul>
			</nav> 
		</div>
		

	    <script type="text/javascript">
		
			
			function delNews(newsID){
				var data = {
					id : newsID
				};
				if(confirm("您确定要删除该条信息吗？")){
					$.ajax({
						url:"/schoolmates/SchoolmateMien/delNews",
						data:data,
						type:"POST",
						success:function(res){
							console.log(res);
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