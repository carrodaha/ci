//require("expose-loader?$!jquery");

$.bread_crumb = $('#ribbon ol.breadcrumb');

function getContextPath(){   //获取项目路径
    var pathName = document.location.pathname;   
    var index = pathName.substr(1).indexOf("/");   
    var result = pathName.substr(0,index+1);   
    return result;   
} 




	 $(window).on('hashchange', function() {
	    checkURL();
    });
	function checkURL(){
		//get the url by removing the hash
		var url = location.hash.replace(/^#/, '');
		alert(url);
		container = $('#content');
		// Do this if url exists (for page refresh, etc...)
		if (url) {
			// remove all active class
			$('nav li.active').removeClass("active");
			// match the url and add the active class
			$('nav li:has(a[href="#' + url + '"])').addClass("active");
			var title = ($('nav a[href="#' + url + '"]').attr('title'))

			// change page title from global var
			document.title = (title || document.title);
			//console.log("page title: " + document.title);

			// parse url to jquery
			loadURL(url + location.search, container);
		} else {
			// grab the first URL from nav
			var $this = $('nav > ul > li:first-child > a[href!="#"]');
			//update hash
			window.location.hash = $this.attr('href');

		}

	};

	function loadURL(url, container){
		//console.log(container)
		
		$.ajax({
		type : "GET",
		url : url,
		dataType : 'html',
		cache : true, // (warning: this will cause a timestamp and will call the request twice)
		beforeSend : function() {
			// cog placed
			container.html('<h1> Loading...</h1>');
		
			// Only draw breadcrumb if it is main content material
			// TODO: see the framerate for the animation in touch devices
			
			if (container[0] == $("#content")[0]) {
				drawBreadCrumb();
				// scroll up
				$("html").animate({
					scrollTop : 0
				}, "fast");
			} 
		},
		/*complete: function(){
	    	// Handle the complete event
	    	// alert("complete")
		},*/
		success : function(data) {
			// cog replaced here...
			//alert("success");
			//$("#content").html(data);
			//container.html(data);
			 
			container.css({
				opacity : '0.0'
			}).html(data).delay(50).animate({
				opacity : '1.0'
			}, 300);
		},
		error : function(xhr, ajaxOptions, thrownError) {
			container.html('<h4 style="margin-top:10px; display:block; text-align:left"><i class="fa fa-warning txt-color-orangeDark"></i> Error 404! Page not found.</h4>');
		},
		async : false
		});
	};

	function drawBreadCrumb() {
		var nav_elems = $('nav li.active > a'), count = nav_elems.length;
		
		//console.log("breadcrumb")
		$.bread_crumb.empty();
		$.bread_crumb.append($("<li>Home</li>"));
		nav_elems.each(function() {
			$.bread_crumb.append($("<li></li>").html($.trim($(this).clone().children(".badge").remove().end().text())));
			// update title when breadcrumb is finished...
			if (!--count) document.title = $.bread_crumb.find("li:last-child").text();
		});

	};
	
//----------------------------------------------------------------------通用方法	
	function validateIP(ip){	//校验IP格式
		var regIP=/^((([1-9]\d?)|(1\d{2})|(2[0-4]\d)|(25[0-5]))\.){3}(([1-9]\d?)|(1\d{2})|(2[0-4]\d)|(25[0-5]))$/;
		//var regIP2 = /^localhost%/;		//localhost放行
		if(ip==''){
			showErrMsg("IP地址不能为空!");
			$("#svnIp").focus();
			return false;
		}
		
		if(!regIP.test(ip)){
			showErrMsg("IP格式不正确");
			return false;
		}else{
			hideErrMsg();
			return true;
		}
	}
	
	function showErrMsg(msg){
		hideNoteMsg();
		$("#messageTextErr").html(msg);
		$("#messagePanelErr").show();
	}
	function hideErrMsg(){
		$("#messagePanelErr").hide();
	}
	
	function showNoteMsg(msg){
		hideErrMsg();
		$("#messageTextNote").html(msg);
		$("#messagePanelNote").show();
	}
	function hideNoteMsg(){
		$("#messagePanelNote").hide();
	}
	
	//日期格式化方法
	Date.prototype.Format = function (fmt) {
	    var o = {
	        "M+": this.getMonth() + 1, //月份        
	        "d+": this.getDate(), //日        
	        "h+": this.getHours() % 12 == 0 ? 12 : this.getHours() % 12, //小时        
	        "H+": this.getHours(), //小时        
	        "m+": this.getMinutes(), //分        
	        "s+": this.getSeconds(), //秒        
	        "q+": Math.floor((this.getMonth() + 3) / 3), //季度        
	        "S": this.getMilliseconds() //毫秒        
	    };
	    var week = {
	        "0": "/u65e5",
	        "1": "/u4e00",
	        "2": "/u4e8c",
	        "3": "/u4e09",
	        "4": "/u56db",
	        "5": "/u4e94",
	        "6": "/u516d"
	    };
	    if (/(y+)/.test(fmt)) {
	        fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	    }
	    if (/(E+)/.test(fmt)) {
	        fmt = fmt.replace(RegExp.$1, ((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? "/u661f/u671f" : "/u5468") : "") + week[this.getDay() + ""]);
	    }
	    for (var k in o) {
	        if (new RegExp("(" + k + ")").test(fmt)) {
	            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	        }
	    }
	    return fmt;
	}
	
	function isNone(checkID, errmsg) {
		var CID = $.trim($("#" + checkID)[0].value);
		if (CID == '') {
			$("#" + checkID).focus();
			showErrMsg(errmsg);
			return false;
		}
		return true;
	}



//export{initRouter};