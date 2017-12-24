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
		  <h1>新增校友期刊</h1>
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

		<script type="text/javascript">
			var ajaxSubmit = function(){
				var getData = function(){
					var data = {
						title:$('#title').val()
					}
					return data;
				}
				var data = getData();
				$.ajax({
					url:"/schoolmates/SchoolmatePublish/addPublish",
					type:'post',
					data:data,
					success:function(res){
						if(res == "ok"){
							alert("添加成功");
							window.location.href = "/schoolmates/SchoolmatePublish/index";
						}else {
							alert("添加失败");
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