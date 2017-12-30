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
	<title>indexSubPage</title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/bootstrap.min.css">
	<script type="text/javascript" src="<%=basePath %>js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	<style type="text/css">
		.bg{
			width:100%;
			/*height:1100px;
			/*background-image: url("__PUBLIC__/res/lin-nybg.jpg");*/
		    z-index: -1;
		    position: absolute;
		    top:0;
		}
		.content{
			z-index: 3;
			width:85%;
			margin-left: 10%;
			margin-top: 16px;
			height:580px;
			/*padding:0px 0px 0px 16px;*/
			border-radius: 10px;
			opacity: 1;
			background-color: #fff;
		}
		.content .row{
			width:100%;
		}


		.content .title{
			color:#7d0000;
			font-size:20px;
			font-weight: 800;

		}
		.content .hr{
			margin-left: 2px;
			height:2px;
			margin-top: 5px;
			width:5.7em;
			background-color: #7d0000;
		}

		.news{
			border-right: 1px solid #7d0000;
			border-bottom: 1px solid #7d0000;
			height: 300px;
			overflow: hidden;
			text-overflow: hidden;
		}
		.news-content{
			font-size: 16px;
			line-height:30px;
		}
		.news .news-title{
			overflow: hidden;
			overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
		}
		.news-title a{
			color:#333;
			font-size:12px;
			overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
		}
		.news-date{
			color:#777;
			font-size:10px;
			overflow:hidden;white-space:nowrap;text-overflow:ellipsis;
		}

		.activity{
			border-right: 1px solid #7d0000;
			border-bottom: 1px solid #7d0000;
			height: 300px;
		}

		.msg{
			border-bottom: 1px solid #7d0000;
			height: 300px;
		}

		.mien{
			border-right: 1px solid #7d0000;
			height: 400px;
		}


		.mienDetail {
			width:80%;
			margin-left: 5%;
			position: absolute;		
			margin-top: -42%;
		}

		.mienDetail frame {
		}
		.mienDetail .closeBtn {
			background-color: #999;
			color:#fff;
			width:3em;
			height:3em;
			line-height: 3em;
			text-align: center;
		}
		
		.mien-img {
			width: 80%；
			margin-left:10%;
		}

		.mien-img .img{
			width:80%;
			background-repeat:no-repeat;
			background-size:cover;
			height:20em;
			background-size: 0.8;
			padding-top:2em;
			padding-bottom:2em;
			border-radius: 10px;
		}

		.carousel .left-carousel {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			width: 10%;
			font-size: 20px;
			color: #fff;
			text-align: center;
			text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
			filter: alpha(opacity=50);
			opacity: .5;
			background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
			background-image:      -o-linear-gradient(left, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
			background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .5)), to(rgba(0, 0, 0, .0001)));
			background-image:         linear-gradient(to right, rgba(0, 0, 0, .5) 0%, rgba(0, 0, 0, .0001) 100%);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
			background-repeat: repeat-x;
		}
		.carousel .right-carousel {
			position: absolute;
			top: 0;
			bottom: 0;
			left: 0;
			width: 10%;
			font-size: 20px;
			color: #fff;
			text-align: center;
			text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
			filter: alpha(opacity=50);
			opacity: .5;

			right: 0;
			left: auto;
			background-image: -webkit-linear-gradient(left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .1) 100%);
			background-image:      -o-linear-gradient(left, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .1) 100%);
			background-image: -webkit-gradient(linear, left top, right top, from(rgba(0, 0, 0, .0001)), to(rgba(0, 0, 0, .5)));
			background-image:         linear-gradient(to right, rgba(0, 0, 0, .0001) 0%, rgba(0, 0, 0, .1) 100%);
			filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
			background-repeat: repeat-x;
		}
		.carousel .titlePanel {
			/*position: absolute;*/
			margin-top: 0.3em;
			bottom: 0;
			width: 80%;
			font-size: 20px;
			color: #666;
			text-align: center;
			text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
			filter: alpha(opacity=50);
		}

		.carousel .descriptionPanel {
			text-align: left;
			position: absolute;
			top: 120px;
			bottom: 0;
			right: 15%;
			width: 30%;
			font-size: 10px;
			color: #666;
			text-align: center;
			text-shadow: 0 1px 2px rgba(0, 0, 0, .6);
			filter: alpha(opacity=50);
		}

		.to-more {
			font-size:10px;
			float:right;
			margin-top:-1.5em;
			color:#7d0000;
			opacity: 0.6
		}

		#myCarousel img{
			width:80%;
			height:460px;
		}
	</style>
</head>
<body style="min-width: 100%">

       <%
           ArrayList newslist1=(ArrayList)request.getAttribute("newslist1");
	       ArrayList newslist2=(ArrayList)request.getAttribute("newslist2");
	       ArrayList newslist3=(ArrayList)request.getAttribute("newslist3");
	       ArrayList newslist4=(ArrayList)request.getAttribute("newslist4");
	       ArrayList newslist5=(ArrayList)request.getAttribute("newslist5");
			 
        %>
	<div class="bg"></div>
	<div align="center">

		<div id="myCarousel" class="carousel slide" data-interval="4000">
		    <!-- 轮播（Carousel）指标 -->
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li> 
                <li data-target="#myCarousel" data-slide-to="3"></li>
                <li data-target="#myCarousel" data-slide-to="4"></li>
		    </ol>  
		    <!-- 轮播（Carousel）项目 -->
		    <div class="carousel-inner">
		        <div class="item active">
		            <img src="<%=basePath %>res/index_head_1.jpg" alt="First slide">
		        </div>
		        <div class="item">
		            <img src="<%=basePath %>res/index_head_2.jpg" alt="Second slide">
		        </div>
		        <div class="item">
		            <img src="<%=basePath %>res/index_head_3.jpg" alt="Third slide">
		        </div>
                <div class="item">
		            <img src="<%=basePath %>res/index_head_4.jpg" alt="Fourth slide">
		        </div>
		    </div>
		    <!-- 轮播（Carousel）导航 -->
		    <a class="carousel-control left" href="#myCarousel" 
		        data-slide="prev">&lsaquo;</a>
		    <a class="carousel-control right" href="#myCarousel" 
		        data-slide="next">&rsaquo;</a>
		    <!-- 控制按钮 -->
		    <!--<div style="text-align:center;">
		        <input type="button" class="btn start-slide" value="Start">
		        <input type="button" class="btn pause-slide" value="Pause">
		        <input type="button" class="btn prev-slide" value="Previous Slide">
		        <input type="button" class="btn next-slide" value="Next Slide">
		        <input type="button" class="btn slide-one" value="Slide 1">
		        <input type="button" class="btn slide-two" value="Slide 2">            
		        <input type="button" class="btn slide-three" value="Slide 3">
		    </div> -->
		</div> 
		<!-- <img style="width:90%;height: 460px;margin-bottom:0em;border-radius:10px" src="__PUBLIC__/res/index.jpg"> -->
	</div>
	
	<div class="content" id="content">
		
		<div class="row">
			<div class="col-md-4 news">
				<div class="title" onclick="toMore('NewsCenter')">
					新闻公告
				</div>
				<div class="hr"></div>
				<div onclick="toMore('NewsCenter')" class="to-more">
					更多>>
				</div>
				<div class="news-content">
					<div class="row" style="width:100%;padding-top:16px">
						  <% for (int i = 0; i < newslist1.size(); i++) {
                                News news = (News)newslist1.get(i);
                            %>
							<div class="col-md-9 news-title">
								<a href="/schoolmates/Home/NewsCenter/showDetail?newsID=<%=news.getNewsID()%>">
									<%=news.getTitle() %>
								</a>
							</div>
							<div class="col-md-3 news-date">
								<%=news.getDate() %>
							</div>
						<%} %>
					</div>
				</div>
			</div>
			<div class="col-md-4 activity news">
				<div class="title" onclick="toMore('SchoolmateActived')">
					校友活动
				</div>
				<div class="hr"></div>
				<div onclick="toMore('SchoolmateActived')" class="to-more">
					更多>>
				</div>
				<div class="news-content">
					<div class="row" style="width:100%;padding-top:16px">
						  <% for (int i = 0; i < newslist2.size(); i++) {
                                SchoolmateActivity news = (SchoolmateActivity)newslist2.get(i);
                            %>
							<div class="col-md-9 news-title">
								<a href="/schoolmates/Home/SchoolmateActived/showDetail?id=<%=news.getId()%>">
									<%=news.getTitle()%>
								</a>
							</div>
							<div class="col-md-3 news-date">
								<%=news.getDate() %>
							</div>
						<%} %>
					</div>
				</div>
			</div>
			<div class="col-md-4 msg">
				<div class="title" onclick="toMore('SchoolmateResources')">
					校友资源共享
				</div>
				<div class="hr" style="width:8.3em"></div>
				<div onclick="toMore('SchoolmateResources')" class="to-more">
					更多>>
				</div>
				<div align="left" class="news-content">
					<div class="row" style="width:100%;padding-top:16px">
						  <% for (int i = 0; i < newslist3.size(); i++) {
                                News news = (News)newslist3.get(i);
                            %>
							<div class="col-md-9 news-title" style="font-size:16px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;line-height:30px">
								<a href="/schoolmates/Home/SchoolmateResources/showDetail?newsID=<%=news.getNewsID()%>">
									<%=news.getTitle() %>
								</a>
							</div>
							<div class="col-md-3 news-date">
								<%=news.getDate() %>
							</div>
						<%} %>
					</div>
				</div>
			</div>
		</div>

		<div class="row" >
			<div class="col-md-4" style="border-right:1px #7d0000 solid;height:400px">
				<div class="title" onclick="toMore('SchoolmatePublish')" style="padding-top:10px">
					校友期刊
				</div>
				<div class="hr"></div>
				<div onclick="toMore('SchoolmatePublish')" class="to-more">
					更多>>
				</div>
				<div align="center" class="row">
				        <% for (int i = 0; i < newslist4.size(); i++) {
                                SchoolmatePublish news = (SchoolmatePublish)newslist4.get(i);
                            %>
						<div class="col-xs-6" align="center">
							<a target="_blank" href="/schoolmates/upload/<%=news.getHead_image() %>">
								<img style="width:80%;margin-top:2em" src="/schoolmates/upload/<%=news.getHead_image() %>" alt="">
							</a>
							<div align="center" style="margin-top:16px">
								
									标题:<%=news.getTitle() %>
									<a target="t_blank" href="/schoolmates/upload/<%=news.getHead_image() %>" download>下载</a>
				
							</div>
						</div>
					<%} %>
				</div>
			</div>
			<div class="col-md-4 mien">
				<div class="title" onclick="toMore('SchoolmateMien')" style="padding-top:10px">
					校友风采
				</div>
				<div class="hr"></div>
				<div onclick="toMore('SchoolmateMien')" class="to-more">
					更多>>
				</div>
				<div>

					<style type="text/css">
						.mien-list {
							margin-top:1em;
							width:96%;
							margin-left: 2%;

						}
						.mien-item {
							height:5em;
						}
						.mien-list img{
							width:60%;
							border-radius: 4px;
						}

						.mien-item .name{
							font-size:16px;
							font-weight: 800;
							color:#666;
						}
						.mien-item .description {
							font-size: 10px;
							margin-top: 8px;
							color: #999;
						}
					</style>
					<div class="mien-list">
						
					        <% for (int i = 0; i < newslist5.size(); i++) {
                                SchoolmateMien news = (SchoolmateMien)newslist5.get(i);
                            %>
							<div class="mien-item row">
								<a href="/schoolmates/Home/SchoolmateMien/showDetail?id=<%=news.getId()%>">
									<div class="col-xs-3">
										<img src="/schoolmates/upload/<%=news.getHead_url() %>" alt="schoolmates">
									</div>
									
									<div class="col-xs-9">
										<div class="name">
											<%=news.getName() %>
										</div> 
										<div class="description">
										   <%=news.getDescription()%> 
										</div>
									</div>
								</a>
							</div>
							<%} %>
					</div>
				</div>
			</div>
			<div class="col-md-4 server">
				<div class="title" onclick="toMore('SchoolmateServe')" style="padding-top:10px">
					校友服务
				</div>
				<div class="hr"></div>
				<div style="margin-top:1em;color:#333">
					<p>
						校友总会邮箱：zdnfxyzh@mail.nfu.edu.cn 
					</p>
					<p>
						邮编：510970
					</p>
					<p>
						联系电话：020-61787163 
					</p>
					<p>
						传真：020-61787368
					</p>
					<p>
						联系地址：广州市从化区温泉大道882号中山大学南方学院行政楼 A2-206
					</p>
				</div>
			</div>
		</div>
		
	</div>
	<div class="mienDetail" align="right" id="mien" hidden>
		<div align="right" class="closeBtn" onclick="hideMien()">
			关闭
		</div>
		<iframe src="mien.html" frameborder="1" width="100%" height="1000px" scrolling="yes"></iframe>
	</div>
	<script type="text/javascript">
		var toMore = function(name){
			var url = "/schoolmates/Home/" + name+"/index";
			window.parent.router(url);
		}
	</script>
</body>
</html>