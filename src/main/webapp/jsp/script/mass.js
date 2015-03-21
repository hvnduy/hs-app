/**
 * Public constant.
 */
var constants = {
	'dashboardPageName': 'dashboard',
	'browsePageName': 'browse',
	'fulfillmentPageName': 'fulfillment',
	'printPageName': 'print'
};

//menu, banner on page
var isBannerDragStarted = false;
var appName = contextPath;
var totalOrder = 0;
var max_record_per_page = 50;
var currentPage = 1;
var docTitle = '';

/************************************************************************************************************
* Global variables for Basket session.
************************************************************************************************************/
var dbContainerIdSelecteor = "#db-content";
var ordersSelectedArray = [];
var droppedDOM_Id = "";
var isDroppedToCart = false;
var isDragging = false;
var loc = '';
var itemInBasket = [];
var totalItemByStatus = 0;


/************************************************************************************************************
 * Public setting
 ************************************************************************************************************/

$(document).bind("ajaxSend", function(e, xhr, settings){
	if(settings.url.indexOf('getNewOrder') < 0 && settings.url.indexOf('autoComplete') < 0){
		if (settings.url.indexOf('.properties') < 0) {
			$("#loading-bar").show(0, function() {
				$('#loadingbar-bg').show();
			});
		}
	}
}).bind("ajaxStop", function(){
	$("#loading-bar").hide(0, function(){
		$('#loadingbar-bg').hide();
	});
	
}).bind('ajaxError', handleAjaxError);

$('#moreOrders').bind('click', function(){
	//	There are no more pages left to load.
	getMoreOrders();
	
});

/**
 * ##############################################################################
 */

$(document).ready(function() {
	//initLoadingBar();
});

/**
 * hightlighted current page on main menu
 */
function mainMenuHightlighted(){
	$('.mass-menu li').each(function() {
		var href = $(this).find('a').attr('href');
	    if (window.location.pathname.indexOf(href) >= 0) {
			$(this).addClass('menu-selected');
		}
	});
}

/**
 * create HTML element for loading bar.
 * @author sydo
 */
function initLoadingBar() {
	var loading = '<div id="loading-bar">'
		+ '<div class="content">'
			+ '<p><img src="' + appName + '/image/loading_small.gif" > <span>' + getMessage(languageCode, 'please_wait') + '</span></p>'
		+ '</div>'
	+'</div>';
	var loadingBg = document.createElement('DIV');
	$(loadingBg)
		.attr('id', 'loadingbar-bg')
		.addClass('modal-backdrop fade in loading-bar-backend')
		.css({//'z-index': '9999998',
			'width': '100%',
			'height': '100%'
		})
		.prependTo('body');
	var loadingObj = $($.parseHTML(loading));
	
	$(loadingObj)
		.css({
			'z-index': 999999, 
			'overflow': 'hidden',
			'top': '32%',
			'left': 0,
			'bottom': 0,
			'right': 0,
			'width': '100%',
			'height': '100%',
			'position': 'fixed',
			'display': 'none'
		})
	.prependTo('body');
}


/**
 * Handle ajax error.
 * @param jqXHR
 * @param errorStatus errorStatus
 * @param exception exception
 */
function handleAjaxError(jqXHR, errorStatus, exception){
	var errorStr = '';
	
	var reqUrl = exception.url + '';
	if(reqUrl.indexOf('getNewOrder') >= 0){
		return false;
	}
	
    if (errorStatus.status == 102) {
    	errorStr = getMessage(languageCode, 'connection_refused');
    	
    } else if (errorStatus.status == 0) {
    	errorStr = 'Not connect.\nVerify Network.';
    	window.location.href=document.URL;
    	
    } else if (errorStatus.status == 404) {
    	errorStr = 'Requested page not found. [404]';
    	
    } else if (errorStatus.status == 500) {
    	errorStr = 'Internal Server Error [500].';
    	
    } else if (errorStatus.status == 901) {
    	window.location.href = appName;
    	
    } else if (exception === 'parsererror') {
    	errorStr = 'Requested JSON parse failed.';
    	
    } else if (exception === 'timeout') {
    	errorStr = 'Request Time out.';
    	
    } else if (exception === 'abort') {
    	errorStr = 'Ajax request aborted.';
    	
    } else {
    	errorStr = 'Uncaught Error.\n' + errorStatus.statusText;
    }

    if(errorStatus.status != 901){
    	alert(errorStr);
    }
    
    return false;
}

/**
 * Export to excel.
 * @param orderIds
 * @author ThangHT
 */
function exportExcel(orderIds) {
	$("body").append('<div id="temp"></div>');
	$("#temp").append('<form id="frmExcel" action="' + appName + '/print/export_excel" method="POST"></form>');
	$("#frmExcel").append('<input type="hidden" name="allOrders" value="'+orderIds.toString()+'">');
	$('#frmExcel').submit();
	$("#frmExcel").click();
	$("#temp").remove();
}

/**
 * ###############################################################
 * Common function
 * ###############################################################
 */
function scrollToElementId(selector, elmId){
	if(!$(elmId).length){
		return;
	}
	
	$(selector).clearQueue().animate({scrollTop: $(elmId).offset().top - $(selector).offset().top + $(selector).scrollTop()}, 1000);
}

/**
 * Show message, type: info, success, warning and danger.
 * @param message
 */
function showMessage(message, type) {
	//type: info, success, warning and danger 
	$.growl(message, { type: type === '' ? "success" : type });
}

/**
 * Print all properties of an object to Console.
 * @param obj javascript's object
 */
function printAllPropertiesObject(obj){
	$.each(obj, function(i, val){
		console.log("Prop.Name= " + i + " | Prop.Value=" + val);
	});
}

/**
 * verifySessionForAjax.
 */
function verifySessionForAjax(respone){
	if(respone.error == "timeOut"){
		//window.location.href=document.URL;
		return false;
	} else {
		if (respone.toString().search('title-span-for-check-login-page') > 0) {
			//window.location.href=document.URL;
			return false;
		}else if (respone.toString().search('Oops-we') > 0) {
//			window.location.href="jsp/common/unhandledError.jsp";
//			return false;
			$("body").html(respone.toString());
		}
	}
	return true;
}


/**
 * get parameter value from URL.
 * @param paramName parameter name
 * @returns value of parameter name
 * @author sydo
 */
function getParameterFromUrl(paramName){
	paramName = paramName.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
	var regexS = "[\\?&]"+paramName+"=([^&#]*)";
	var regex = new RegExp( regexS );
	var results = regex.exec(window.location.href);
	if( results == null )
		return "";
	else
		return decodeURIComponent(results[1].replace(/\+/g, " "));
}

/**
 * disable selection by drag-and-drop. 
 * @author sydo
 */
function disableSelection() {
	//var db = document.getElementById('db-content');
	//var cart = document.getElementById('cart');
	if($.basket.settings.page == constants.dashboardPageName || $.basket.settings.page == constants.fulfillmentPageName){
		document.onselectstart = clearSelection;
	}
	
	function clearSelection() {
		if (window.getSelection){
			window.getSelection().removeAllRanges();
		}
		return false;
	}
}
	
/**
 * detect idle's document status.
 * @param callbackFunction execute function
 * @param time time out for IDLE status (ms)
 * @author sydo
 */
function detectIDLE(callbackFunction, time, element){
	var timeout = null;
    var timee = (time)? time : '10000';
    
    var elm = (element)? element : document;
    $(elm).bind('click keyup mousemove', function(event) {
    	if (timeout !== null) {
    		clearTimeout(timeout);
        }
        timeout = setTimeout(function() {
        	timeout = null;
//        	console.log('Document Idle since '+timee+' ms');
    		callbackFunction();
        }, timee);
    });
}


function isExistItem(item, array){
	return ($.inArray(item, array) != -1);
};

/**
 * Remove the elements in {list1} that are contained in the {list2}.
 * @param list1
 * @param list2
 * @returns list removed elements intersection
 * @author sydo
 */
function removeIntersectElments(list1, list2){
	var dest = [];
	if(list1 && list2 && list1.length > 0){
		for(var i = 0; i < list1.length; i++){
			if(!isExistItem(list1[i], list2)){
				dest.push(list1[i]);
			}
		}
	}
	
	return dest;
}

/**
 * get message from properties file.
 * @param langCode language code
 * @param key property key
 * @returns {String}
 * @author sydo
 */
function getMessage(langCode, key){
	jQuery.i18n.properties({
	    name:'js_messages', 
	    path:'resources/sources/',
	    mode:'both',
	    language:(langCode == 'en')? '' : langCode	// default language is English
	});
	
	var result = '';
	if(arguments.length == 2){
		result = jQuery.i18n.prop(key);
	}else if(arguments.length > 2){
		result = jQuery.i18n.prop(key, arguments[2]);
	}
    return result;
}

/**
 * Building A Case-Insensitive :contains()
 */
jQuery.expr[':'].contains = function(a,i,m){
	return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};



/**
 * detect scroll direction.
 */
function customHeaderBar(){
	var previousScroll = 0;
	var obj = $('#header').clone().addClass('navbar-fixed-top docking');
	$(obj).appendTo('body').hide();
//	var scrollUpCount = 0;
	$(window).scroll(function () {
		var currentScroll = $(this).scrollTop();
		
		if (currentScroll > previousScroll){
//			console.info('down');
			$(obj).hide();
		}else if (currentScroll < previousScroll){
			// for IE
//			console.info('up');
			
//			scrollUpCount++;
//			if(scrollUpCount > 1){
//				$('#header').removeClass('navbar-fixed-top docking');
//				scrollUpCount = 0;
//			}
//			console.log(scrollUpCount);
			
			if(currentScroll == 0){
				$(obj).hide();
			}else{
				$(obj).show();
				detectIDLE(function(){
					$(obj).hide();
				}, 3000);
			}
		}
		previousScroll = currentScroll;
	});
}

function showErrorDialog(msg){
	$.growl(msg,
	{
		type: 'danger',
		position: {from: 'top',align:'center'},
		offset: 20,
		z_index: 9999
	});
}

