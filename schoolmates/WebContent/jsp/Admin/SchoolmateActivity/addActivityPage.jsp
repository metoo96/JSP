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
	  <h1>创建活动</h1>
	</div>
	<div style="width: 85%">
		<form class="form-horizontal">
			<div class="form-group">
		    	<label for="title" class="col-sm-2 control-label">标题</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="title" class="form-control">
		    	</div>
		 	</div>
		 	<div class="form-group">
		    	<label for="author" class="col-sm-2 control-label">作者</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="author" class="form-control">
		    	</div>
		 	</div>
		</form>
	</div>
	
	<div align="center">
		<textarea id="editor_id" name="content" style="width:700px;height:300px;">
			请输入活动详细内容，包括时间、地点人物、报名方式
		</textarea>
	</div>
		
	<div align="center" style="margin-top: 2em;">
		<button type="button" class="btn btn-primary" onclick="getData()">提交</button>
	</div>


	<div align="center" style="margin-top: 1em;">
		<form id="editForm" name="editForm" method="post" action="{:U('Home/SchoolmateActived/preview')}" target="colors123" onsubmit="openSpecfiyWindown( 'colors123' )">  
		 <fieldset>  
		  <input name="content" id="content" hidden/>
		  <input name="author" id="Iauthor" hidden/>
		  <input name="title" id="Ititle" hidden/>
		  <input class="btn btn-warning" type="submit" value="预览" onmousedown="setInput()" />  
		 </fieldset>  
		</form> 
	</div>

	 <script type="text/javascript" src="<%=basePath %>js/backgroundAdmin/NewsCenter/kindeditor/kindeditor-all.js"></script>
	  <script type="text/javascript" src="<%=basePath %>js/backgroundAdmin/NewsCenter/kindeditor/lang/zh-CN.js"></script>

	  <script>
		   var editor;
	       KindEditor.ready(function(K) {
	       editor = K.create('#editor_id', {
	       cssPath : '<%=basePath%>js/backgroundAdmin/NewsCenter/kindeditor/plugins/code/prettify.css',
	       uploadJson : '<%=basePath%>js/backgroundAdmin/NewsCenter/kindeditor/jsp/upload_json.jsp',//标识处理图片的文件
	       fileManagerJson : '<%=basePath%>js/backgroundAdmin/NewsCenter/kindeditor/jsp/file_manager_json.jsp',
	       allowFileManager : true,//允许上传文件和图片
	       afterCreate : function() {
	       this.sync();
	       },
	       afterBlur:function(){
	       this.sync();
	       }
	       });
	       //prettyPrint();
	       });

	        function saveData(){
	        	var html = editor.html();
	        	editor.sync();
	        	html = document.getElementById('editor_id').value;
	        	window.localStorage['NewsEditContent'] = html;
	        }

	        function setInput(){
	        	var html = editor.html();
	        	editor.sync();
	        	html = document.getElementById('editor_id').value;
	        	$('#content').val(html);
	        	$('#Ititle').val($('#title').val());
				$('#Iauthor').val($('#author').val());
				console.log($('#Iauthor').val())
	        }

	        function openSpecfiyWindown( windowName )   {   
			    window.open('about:blank',windowName,'width=1600,height=900,menubar=no,scrollbars=no');   
			}

	        function getData(){
	        	var html = editor.html();
	        	editor.sync();
	        	html = document.getElementById('editor_id').value;

	        	var data = {
	        		content:html,
	        		title:$('#title').val(),
	        		author:$('#author').val()
	        	}
	        	console.log(data)
	        	var success = function(){
	        		alert('上传成功');
	        		window.location.href="/schoolmates/SchoolmateActivity/index"

	        	}

	        	var error = function(res){
	        		alert('上传失败,原因：'+res);
	        	}

	        	$.ajax({
	        		url:"/schoolmates/SchoolmateActivity/addActivity",
	        		type:"POST",
	        		data:data,
	        		success:function(res){
	        			console.log(res)
	        			if(res == "ok"){
	        				success();
	        			}else {
	        				error(res);
	        			}
	        		},
	        		error:function(){
	        			alert('网络错误');
	        		}
	        	})
	        }
	        

	</script>

	</body>
</html>