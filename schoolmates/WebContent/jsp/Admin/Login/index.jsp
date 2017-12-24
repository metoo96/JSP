<%@ page contentType="text/html; charset=utf-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">+
	<head>
	<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://"

            + request.getServerName() + ":" + request.getServerPort()

            + path + "/";
     %>
        <base href="<%=basePath%>">
        <base src ="<%=basePath%>">
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>后台登录</title>
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>
	<body>
	
	<div align="center" class="page-header">
	    <h1>网站后台登录</h1>
	</div>
		
	<div style="width: 70%;margin-left: 15%">
		<h3>登录</h3>
		<hr>
		  <div class="form-group">
		    <label for="exampleInputEmail1">用户名:</label>
		    <input type="text" class="form-control" name="account" id="account" placeholder="Account">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">密码:</label>
		    <input type="password" class="form-control" name="password" id="password" placeholder="Password">
		  </div>
		  <button onclick="submit()" class="btn btn-default">登录</button>
	</div>
	
	<script type="text/javascript">
			function submit(){
				var account = $('#account').val();
				var password = $('#password').val();

				$.ajax({
					url:"Admin/Login/index",
					type:'POST',
					data:{
						account:account,
						password:password
					},
					success:function(res){
						if (res == "ok") {
							 alert('登录成功');
						     window.location.href="<%=basePath%>jsp/Admin/Index/index.jsp";
							//window.location.href="success.jsp";
						} else {
							alert('登录失败');
						}
					}
				})
			}
		</script>
	</body>
</html>