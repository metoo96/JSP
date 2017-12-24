// window.onload = function(){
// 	console.log(231)
// }
// var base_url = "http://localhost/thinkPHP/first/nfsysu_schoolmate";
// // var base_url = "http://115.28.241.66/php/nfsysu_schoolmate";
// // var base_url = "http://www.cybergear-cn.com/php/NfsysuSchoolmate";
// var initListener = function(){
// 	//navbars 
// 	$('#router-index').on('click',function(){
// 		window.location.href=base_url+"/Home/index/index";
// 	})

// 	$('#router-newsCenter').on('click',function(){
		
// 	})

// 	//jump
// 	$('#jumpButton').on('click',function(){
// 		var page = $('#news-pages').val();
// 		console.log(123)
// 		window.location.href=base_url+"/Home/newsCenter/index?page="+page;
// 	})

// 	$('#lastPageButton').on('click',function(){
// 		var thisPageNumber = parseInt($('#thisPage')[0].innerHTML);
// 		var maxPageNumber = parseInt($('#maxPage')[0].innerHTML);

// 		if(thisPageNumber !== 1){
// 			window.location.href=base_url+"/home/newsCenter?page="+parseInt(thisPageNumber-1);
// 		}
// 	})

// 	$('#nextPageButton').on('click',function(){
// 		var thisPageNumber = parseInt($('#thisPage')[0].innerHTML);
// 		var maxPageNumber = parseInt($('#maxPage')[0].innerHTML);

// 		if(thisPageNumber !== maxPageNumber){
// 			window.location.href=base_url+"/home/newsCenter?page="+parseInt(thisPageNumber+1);
// 		}
// 	})
// }


// var init = function(){
// 	initListener();
// };
// init();
