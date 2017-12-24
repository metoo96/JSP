<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		<title>朱国柱</title>
	
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/indexStyle.css">
		</head>
	<body style="min-width: 100%" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" width="100%">
		<div id="header" class="header">
			<span class="logo">
				<img src="<%=basePath %>res/logo.png">
				<span class="sub-title">
					数字校园(校友网)
				</span>
			</span>
		</div>
		<div class="hr"></div>

		<div class="navbar" id="navbar" align="center">
			<span id="router-index">
				<a href="/schoolmates/index">
					首页
				</a>
			</span>
			<span id="router-newsCenter">
				<a href="/schoolmates/Home/NewsCenter/index">
					新闻公告
				</a>
			</span>
			<span id="router-schoolmate-organize">
				<a href="/schoolmates/Home/SchoolmateOrganize/index">
					校友总会
				</a>
			</span>
			<span id="router-schoolmate-activied">
				<a href="/schoolmates/Home/SchoolmateActived/index">
					校友活动
				</a>
			</span>
			<span id="router-schoolmate-activied">
				<a href="/schoolmates/Home/SchoolmateResources/index">
					校友资源共享
				</a>
			</span>

			<span id="router-schoolmate-activied">
				<a href="/schoolmates/Home/SchoolmateMien/index">
					校友风采
				</a>
			</span>
			<span id="router-school-periodical">
				<a href="/schoolmates/Home/SchoolmatePublish/index">
					校友期刊
				</a>
			</span>
			<span id="router-schoolmate-serve">
				<a href="/schoolmates/Home/SchoolmateServe/index">
					校友服务
				</a>
			</span>
		</div>

		<div class="nav-navbar" align="right">
			<span id="position">
				当前位置:首页 
			</span>
		</div> 
		<div id="index">
			
			
			<iframe src="/schoolmates/Home/Index/subPage" width="100%" height="1100px" frameBorder="0" scrolling="yes"></iframe>




		</div>

		<!-- 
			加模块 ：1、联系方式
					2、校友服务
					3、到处链接的模块
		 -->

		<div class="footer" style="height:7em;">
			<br>
			<div align="center">
				<div align="center" style="color:#fff;font-size: 13px;line-height: 2em">
					<div style="margin-top:0em;margin-bottom:0.5em;color:#999;font-size:24px">
						--------友情链接--------
					</div>
					<style type="text/css">
						.links a{
							color:#fff;
							font-size:18px;
							text-decoration: none;
							/*margin:0 1em 0 1em;*/
						}
						.links-1 a{
							color:#fff;
							font-size:18px;
							text-decoration: none;
							/*margin:0 1em 0 1em;*/
						}
						.links {
							box-sizing: border-box;
						}
						.links div{
							float:left;
							box-sizing: border-box;
							width:15%;
							/*margin : 0 2em 0 2em;*/
						}
						
						.links-1 {
							box-sizing: border-box;
						}
						.links-1 {
							box-sizing: border-box;
						}
						.links-1 div{
							float:left;
							box-sizing: border-box;
							width:15%;
							/*margin : 0 2em 0 2em;*/
						}
					</style>
					<div align="center" class="links" style="padding-left:10%;line-height:20px;">
						<div align="left">
							<a href="http://wcx.nfu.edu.cn/">文学与传媒系</a>
						</div>
						<div align="left">
							<a href="http://wy.nfu.edu.cn/">外国语言文学系</a>
						</div>
						<div align="left">
							<a href="http://sece.nfu.edu.cn/">电气与计算机工程学院</a>
						</div>
						<div align="left">
							<a href="http://gggl.nfu.edu.cn/">公共管理学系</a>
						</div>
						<div align="left">
							<a href="http://art.nfu.edu.cn/">艺术设计与创意产业系</a>
						</div><div align="left">
							<a href="#">音乐系</a>
						</div>
					</div>
					<br>
					<div align="center" class="links-1" style="padding-left:10%;line-height:20px;">
						<div align="left">
							<a href="http://hlx.nfu.edu.cn/">健康与护理系</a>
						</div>
						<div align="left">
							<a href="http://yxjy.nfu.edu.cn/">医学与健康管理系</a>
						</div>
						<div align="left">
							<a href="http://glx.nfu.edu.cn/">商学院</a>
						</div>
						<div align="left">
							<a href="http://kjx.nfu.edu.cn/">会计学院</a>
						</div>
						<div align="left">
							<a href="http://apbs.nfu.edu.cn/">政商研究院</a>
						</div>
						<div align="left">
							<a href="http://jx.nfu.edu.cn/">继续教育学院</a>
						</div>
					</div>
				</div>
			</div>
			
		</div>

		<div id="loginUrl" style="visibility: hidden;opacity: 0" hidden>
			{:U('Home/Index/login')}
		</div>
		<div id="registerUrl" style="visibility: hidden;opacity: 0" hidden>
			{:U('Home/Index/register')}
		</div>
		<!-- jQuery -->
		<!-- <script src="./Public/js/jquery-2.2.4.min.js"></script> -->
		<script src="__PUBLIC__/js/jquery-2.2.4.min.js"></script>
		<script type="text/javascript" src="__PUBLIC__/js/index/router.js">
		</script>

		<script type="text/javascript">
			var router = function (url){
				window.location.href = url;
			}
		</script>

		<script type="text/javascript">

			window.onload = function(){
				$('#loginPanel').hide();
				$('#registerPanel').hide();
			}

			var panelState = 0;//1 login;2 register;0 none
			var hideLoginPanel = function(){
				$('#loginPanel').fadeOut(300);
				$('#registerPanel').fadeOut(300);
			}
			var loginPanel = function(){
				hideLoginPanel();
				if(panelState === 1){
					panelState = 0;
					return;
				}
				panelState = 1;
				$('#loginPanel').fadeIn(300);
			}
			var registerPanel = function(){
				hideLoginPanel();
				if(panelState === 2){
					panelState = 0;
					return;
				}
				panelState = 2;
				$('#registerPanel').fadeIn(300);
			}

			var login = function(){

				var account = $('#account').val();
				var password = $("#password").val();

				$.ajax({
					url:$('#loginUrl').html(),
					type:"POST",
					data:{
						account:account,
						password:password
					},
					success:function(response){
						if(response.success){
							alert('登录成功');
							window.location.reload();
						}else {
							alert(response.errmsg);
						}
					}
				})

			}
			/*
register_account
register_password
register_confirm_password
register_studentNumber
register_subject
register_name
			*/
			var checkRegisterMsg = function(data){
				for(var i in data){
					if(data[i] == ""){
						alert('信息填漏啦！');
						return ;
					}
				}
				if(data.password.length<6 || data.password.length>16){
					alert('密码长度应为6-16位');
					return false;
				}
				if(data.password !== data.confirm_password){
					alert('两次密码不一样！');
					return false;
				}
				return true;
			}
			var register = function(){
				var data = {
					account:$('#register_account').val(),
					password:$('#register_password').val(),
					confirm_password:$('#register_confirm_password').val(),
					studentNumber:$('#register_studentNumber').val(),
					subject:$('#register_subject').val(),
					name:$('#register_name').val()
				}
				
				if(!checkRegisterMsg(data)){
					return ;
				}

				$.ajax({
					url:$('#registerUrl').html(),
					data:data,
					type:"POST",
					success:function(response){
						if(response.success){
							alert('注册成功');
							window.location.reload();
						}else{
							alert(response.errmsg);
						}
					}
				})

			}

		</script>
	</body>
</html>