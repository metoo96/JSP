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
		<%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		 Integer currentPage = (Integer)request.getAttribute("page");
		 int previousPage = (currentPage-1);
		 int nextPage = (currentPage+1);
        %>
		<div class="page-header">
		  <h1>校友活动模块1</h1>
		</div>

		<div align="right" style="margin-bottom: 1em">
			<a href="<%=basePath %>jsp/Admin/SchoolmateActivity/addActivityPage.jsp" type="button" class="btn btn-primary">发布活动</a>
		</div>
        <div align="center" style="margin-bottom: 1em">
        <!-- 判断是否还有内容 -->
        <% if(newslist.size() == 0){%>
	           <h4 style="color:red;">已经是最后一页了~~</h4>
	    <% }%>
	    </div>
	
       
		<ul class="list-group">
			 <% for (int i = 0; i < newslist.size(); i++) {
                SchoolmateActivity news = (SchoolmateActivity)newslist.get(i);
              %>
				<a  href="/schoolmates/SchoolmateActivity/showDetail?id=<%=news.getId()%>">
				  <li class="list-group-item listItems">
				  	<div class="row">
					  <div class="col-xs-10 col-sm-10 col-md-10">
					  	<font style="color:#666">
					  		<%=news.getDate() %> 作者 <%=news.getAuthor() %>
					  	</font>
					  	<div style="width: 90%;margin-left: 5%">
						    <%=news.getTitle() %>
					  	</div>
					    
					  </div>
					  <div class="col-xs-2 col-sm-2 col-md-2" align="right">
					  	<a type="button" href="/schoolmates/SchoolmateActivity/editPage?id=<%=news.getId() %>" class="btn btn-primary">修改</a>
					  	<a type="button" onclick="delActivity('<%=news.getId() %>')" class="btn btn-danger">删除</a>
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
				      <a href="/schoolmates/SchoolmateActivity/index?page=<%=previousPage%>" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				    <%} %>
	
			         <li class="active"><a href="/schoolmates/SchoolmateActivity/index?page=<%=currentPage%>"><%=currentPage%></a></li>
			 
				    <li>
				      <a href="/schoolmates/SchoolmateActivity/index?page=<%=nextPage%>" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				    </li>
			  </ul>
			</nav> 
		</div>
		
		<script type="text/javascript">
			
			function delActivity(id){
				var data = {
					id : id
				};
				if(confirm("您确定要删除该条信息吗？")){
					$.ajax({
						url:"/schoolmates/SchoolmatesActivity/delNews",
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