<%@ page language="java" import="java.util.*,com.schoolmates.model.*,java.lang.*" contentType="text/html; charset=utf-8"
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
	  <h1>修改校友风采内容</h1>
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
	<div style="width: 85%">
		<form class="form-horizontal">
			<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
		    	<div class="col-sm-10">
		      		<input value="<%=news.getName() %>" type="text" id="name" class="form-control">
		    	</div>
		 	</div>
		 	<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">专业</label>
		    	<div class="col-sm-10">
		      		<input type="text" value="<%=news.getSubject() %>" id="subject" placeholder="如：计算机科学与技术" class="form-control">
		    	</div>
		 	</div>
		 	<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">年级</label>
		    	<div class="col-sm-10">
		      		<input type="text" value="<%=news.getGrade() %>" id="grade" placeholder="如：2014" class="form-control">
		    	</div>
		 	</div>
		 	<div class="form-group">
		    	<label for="inputEmail3" class="col-sm-2 control-label">简介</label>
		    	<div class="col-sm-10">
		      		<input type="text" value="<%=news.getDescription() %>" id="description" placeholder="限制字数50" class="form-control">
		    	</div>
		 	</div>
		 	<div align="center">
				<textarea id="editor_id" id="content" style="width:700px;height:300px;">
					
					<%=news.getContent() %>
				</textarea>
			</div>
		</form>
	</div>
	
	<input id="mienId" value="<%=news.getId() %>" style="visibility: hidden" hidden />
		
	<div align="center" style="margin-top: 2em;">
		<button type="button" class="btn btn-primary" onclick="getData()">提交</button>
	</div>
    
    <%} %>
    
	<div align="center" style="margin-top: 1em;">
			<form id="editForm" name="editForm" method="post" action="{:U('NewsCenter/Preview/index')}" target="colors123" onsubmit="openSpecfiyWindown( 'colors123' )">  
			 <fieldset>  
			  <input name="content" id="content" hidden/>
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
	        }

	        function openSpecfiyWindown( windowName )   {   
			    window.open('about:blank',windowName,'width=1600,height=900,menubar=no,scrollbars=yes');   
			}

	        function getData(){
	        	var html = editor.html();
	        	editor.sync();
	        	html = document.getElementById('editor_id').value;
	        	if($('#description').val().length>50){
	        		alert('简介限制字数为50！');
	        		return;
	        	}
	        	var data = {
	        		id:$('#mienId').val(),
	        		content:html,
	        		name:$('#name').val(),
	        		grade:$('#grade').val(),
	        		subject:$('#subject').val(),
	        		description:$('#description').val(),
	        	}
	        	var success = function(){
	        		alert('修改成功');
	        		window.location.href="/schoolmates/SchoolmateMien/index"
	        	}

	        	var error = function(res){
	        		alert('修改失败,原因：'+res);
	        	}
	        	$.ajax({
	        		url:"/schoolmates/SchoolmateMien/editMien",
	        		type:"POST",
	        		data:data,
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