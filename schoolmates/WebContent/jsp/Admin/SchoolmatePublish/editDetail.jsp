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
		  <h1>修改校友期刊</h1>
		</div>
	
		<div style="width: 85%">
			<form id="dataForm" class="form-horizontal">
				<div class="form-group">
			    	<label for="inputEmail3" class="col-sm-2 control-label">标题</label>
			    	<div class="col-sm-10">
			      		<input type="text" id="title" class="form-control">
			    	</div>
			 	</div>
			 	<div onclick="ajaxSubmit()" class="btn btn-primary">
			 		提交
			 	</div>
			</form>
		</div>
		  <% for (int i = 0; i < newslist.size(); i++) {
		               SchoolmatePublish news = (SchoolmatePublish)newslist.get(i);
		        %>
		<div style="visibility:hidden" id="publishId" hidden>
			<%=news.getId() %>
		</div>
		<%} %>


		<script type="text/javascript">
			var ajaxSubmit = function(){
				var getData = function(){
					var data = {
						title:$('#title').val(),
						id:$('#publishId').html()
					}
					return data;
				}
				var data = getData();
				$.ajax({
					url: "/schoolmates/SchoolmatePublish/editDetail",
					type:'post',
					data:data,
					success:function(res){
						if(res == "ok"){
							alert("修改成功");
							window.location.href = "/schoolmates/SchoolmatePublish/index";
						}else {
							alert("修改失败");
						}
					},
					error:function(err){
						alert('网络错误');
						console.log(err);
					}
				})
			}
		</script>
	</body>

</html>