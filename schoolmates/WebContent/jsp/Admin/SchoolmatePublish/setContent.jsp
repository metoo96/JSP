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
		<title>image upload</title>
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
	<div>
		
	</div>
		<div>
			<h1>
			
			</h1>
		</div>
		<!--  <div style="margin-top:3em">
			<form class="form-horizontal" action="/schoolmates/SchoolmatePublish/setContent"" enctype="multipart/form-data" method="post" >
				
				<input type="text" name="id" id="id" value="" style="visibility: hidden"  hidden/>
			
				<input style="height:2em;border:none" onchange="setImage()" id="photo" type="file" class="form-control" name="photo" />
				<div align="center">
					<img id="preview" src="" alt="">
				</div>
				<input style="margin-top: 1em" type="submit" class="btn btn-primary" value="提交" >
			</form>
		</div>
	   -->
		<hr>
		<div>
			<h1>
				单纯下载：
			</h1>
		</div>
		<form class="form-horizontal" action="/schoolmates/SchoolmatePublish/setContent"  method="post" >
			<input id="download_url" type="text" placeholder="下载链接" />
			<div onclick="onlyDownloadSubmit()" class="btn btn-primary">
				提交
			</div>
		</form>
	<script>
		var setImage = function(){
			console.log($('#photo').val())
			// $('#preview').attr('src',$('#photo')[0].value);
		}
		var onlyDownloadSubmit = function(){
			var data = {
				id:$('#id').val(),
				download_url:$('#download_url').val()
			}
			console.log(data)
			$.ajax({
				url:"/schoolmates/SchoolmatePublish/setContent1",
				data:data,
				type:'post',
				success:function(res){
					if(res == "ok"){
						alert("成功");
						window.location.href = "/schoolmates/SchoolmatePublish/index";
					}else {
						alert("失败");
					}
				},
				error:function(err){
					alert('网络错误');
					console.log(er)
				}
			})
		}
	</script>
	</body>
</html>