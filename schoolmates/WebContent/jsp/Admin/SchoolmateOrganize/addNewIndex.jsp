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
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Title Page</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css">
		
	</head>
	<body>
	<div class="page-header">
	  <h1>新增校友组织</h1>
	</div>
	<div style="width: 85%">
		<form class="form-horizontal">
			<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">目录名称</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="indexName" class="form-control" id="inputEmail3">
		    	</div>
		 	</div>
		 	<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">文章标题</label>
		    	<div class="col-sm-10">
		      		<input type="text" id="title" class="form-control" id="inputEmail3">
		    	</div>
		 	</div>

		 	<div class="form-group">
				<div class="input-group" style="width:80%;margin-left: 10%">
			      <div class="input-group-btn">
			        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">选择一级目录 <span class="caret"></span></button>
			        <ul class="dropdown-menu">
			          <li><a onclick="setFirstIndex('会长致辞','0')">会长致辞</a></li>
			          <li><a onclick="setFirstIndex('地方校友会','1')">地方校友会</a></li>
			          <li><a onclick="setFirstIndex('院系分会','2')">院系分会</a></li>
			          <li><a onclick="setFirstIndex('组织章程','3')">组织章程</a></li>
			          <li><a onclick="setFirstIndex('学生校友工作协会','4')">学生校友工作协会</a></li>
			        </ul>
			      </div><!-- /btn-group -->
			      <input type="text" id="firstIndexName" class="form-control" aria-label="...">
			    </div><!-- /input-group -->
		 	</div>
		 	

		</form>

	</div>
	
	<div align="center">
		<textarea id="editor_id" name="content" style="width:700px;height:300px;">
			请输入目录文章正文内容
		</textarea>
	</div>
		
	<div align="center" style="margin-top: 2em;">
		<button type="button" class="btn btn-primary" onclick="getData()">提交</button>
	</div>

	 <script type="text/javascript" src="<%=basePath %>js/backgroundAdmin/NewsCenter/kindeditor/kindeditor-all.js"></script>
	  <script type="text/javascript" src="<%=basePath %>js/backgroundAdmin/NewsCenter/kindeditor/lang/zh-CN.js"></script>

	<script type="text/javascript" src="<%=basePath %>js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
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


        var firstIndexNumber;//编号、4为校友工作协会
        function setFirstIndex(name,number){
        	firstIndexNumber = number;
        	$('#firstIndexName').val(name);
	    }

        function getData(){
        	var html = editor.html();
        	editor.sync();
        	html = document.getElementById('editor_id').value;

        	var data = {
        		content:html,
        		title:$('#title').val(),
        		indexTitle:$('#indexName').val(),
        		firstIndexNumber:firstIndexNumber
        	}

        	var success = function(){
        		alert('上传成功');
        		window.location.href="/schoolmates/SchoolmateOrganize/index";

        	}

        	var error = function(res){
        		alert('上传失败,原因：'+res);
        	}

        	$.ajax({
        		url:"/schoolmates/SchoolmateOrganize/addNewIndex",
        		type:"POST",
        		data:data,//ajax发送信息到organize控制器
        		success:function(res){
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