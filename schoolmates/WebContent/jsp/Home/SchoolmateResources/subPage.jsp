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
			height:1000px;
			background-image: url("<%=basePath%>res/lin-nybg.jpg");
		    z-index: -1;
		    position: absolute;
		    top:0;
		}
		.content {
			width:85%;
			margin-left: 7%;
			background-color: #fff;
			opacity: 0.9;
			border-radius: 8px;
			height: 800px;
			margin-top:150px;
		}
		.content .main-content {
			width:80%;
			margin-left: 5%;
			padding-top:32px;
		}

		.content .news-content{
			padding-top: 2em;
			width:80%;
			margin-left: 5%;
		}

		.content .news-content ul li {
			list-style: none;
		}

		.content .news-content .news .title-div{
			white-space:nowrap;
			overflow: hidden;
		　　 text-overflow: ellipsis;
			width: 80%;
		}

		.content .news-content .news .title{
			margin-left: 0em;
			text-decoration:none;
			color:#666;
			font-size: 20px;
			width: 80%;
		}
		.content .news-content .news .title:hover{
			text-decoration:none;
			color:red;
		}
		.content .news-content .news .title:link{
			text-decoration:none;
			color:#333;
		}

		.content .news-content .news .date{
			float:right;
			font-size: 12px;
			color: #777;
		}

		.content .news-content .hr-part{
			height:1px;
			border:none;
			margin:10px 0;
			border-top:1px dashed #cbcbcb;
		}
	</style>
</head>
<body style="min-width: 100%">
    <%
         ArrayList newslist=(ArrayList)request.getAttribute("newslist");
		 Integer currentPage = (Integer)request.getAttribute("page");
		 int previousPage = (currentPage-1);
		 int nextPage = (currentPage+1);
    %>
   
	<div class="bg"></div>
	<div class="content">
		<style>
			.head {
				margin-left: 1em;
				padding-top:0.6em;
				font-size: 30px;
				color:#7d0000;
			}
			.head .hr {
				width:4em;
				height:2px;
				background-color: #7d0000;
			}
		</style>
		<div class="head">
			<div class="font">
				校友资源
			</div>
			<div class="hr">
				
			</div>
		</div>
		<div class="news-content">
		       <div align="center" style="margin-bottom: 1em">
				<!-- 判断是否还有内容 -->
		        <% if(newslist.size() == 0){%>
			           <h4 style="color:red;">已经是最后一页了~~~~~~</h4>
			    <% }%>
			    </div>
			<ul id="news-list">
			     <% for (int i = 0; i < newslist.size(); i++) {
                News news = (News)newslist.get(i);
                 %>
					<li>
						<a href="/schoolmates/Home/SchoolmateResources/showDetail?newsID=<%=news.getNewsID() %>" >
							<div class="news">
								<div class="row">
									<div class="col-xs-11">
										<div class="title">
											<%=news.getTitle() %>
										</div>
										<div class="date">
											<%=news.getDate() %>
										</div>
									</div>
								</div>
							</div>
							<hr class="hr-part" />
						</a>
					</li>
			       <%} %>
			</ul>
		</div>
	  
	
		<div class="nav-footer">
			<div class="row" align="center">
			<div align="center">
			<nav>
			  <ul class="pagination">
			      <% if (currentPage != 1) { %>
				    <li>
				      <a href="/schoolmates/Home/SchoolmateResources/subPage?page=<%=previousPage%>" aria-label="Previous">
				        <span aria-hidden="true">上一页</span>
				      </a>
				    </li>
				    <%} %>
	
			         <li class="active"><a href="/schoolmates/Home/SchoolmateResources/subPage?page=<%=currentPage%>"><%=currentPage%></a></li>
			 
				    <li>
				      <a href="/schoolmates/Home/SchoolmateResources/subPage?page=<%=nextPage%>" aria-label="Next">
				        <span aria-hidden="true">下一页</span>
				      </a>
				    </li>
			  </ul>
			</nav> 
		    </div>
		
			</div>
		</div>
	</div>

   
	<script type="text/javascript">
			
			$('#jumpButton').on('click',function(){
				var page = $('#news-pages').val();

				window.location.href="./subPage?page="+page;
			})
			$('#lastPageButton').on('click',function(){
				var thisPageNumber = parseInt($('#thisPage')[0].innerHTML);
				var maxPageNumber = parseInt($('#maxPage')[0].innerHTML);
				if(thisPageNumber !== 1){
					window.location.href="./subPage?page="+parseInt(thisPageNumber-1);
				}
			})

			$('#nextPageButton').on('click',function(){
				var thisPageNumber = parseInt($('#thisPage')[0].innerHTML);
				var maxPageNumber = parseInt($('#maxPage')[0].innerHTML);

				if(thisPageNumber !== maxPageNumber){
					window.location.href="./subPage?page="+parseInt(thisPageNumber+1);
				}
			})

		</script>
</body>
</html>