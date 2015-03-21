/**
 * Commons
 * @author 
 */
var Common = (function() {
	
	var Common = function() {
		/**
		 * get application name.
		 * @author 
		 */
		this.getAppName = function (p) {
			var s = p.split("/").reverse();
			s.splice(0, 1);
			return s.reverse().join("/");
		};
		
		this.getProjectName = function(p) {
			var s = p.split("/").reverse();
			s.splice(0, 2);
			return s.reverse().join("/");
		};
		/**
		 * support format search range number in text box.
		 * @author 
		 */
		this.searchNumber = function(number) {
			var rs = /^(=|<(=)?|>(=)?)?\s*[0-9]+(\.[0-9]*)*$/;  // so binh thuong
//		    var rs = /^(<(=)?|>(=)?)?\s*[0-9]+[\.[0-9]*]*$/; // so thap phan.		
		    return number.match(rs);
		   
//		    return rs.test(number);
		};
		/**
		 * validate format Email.
		 * @author 
		 */
		this.validateEmail = function (val) {
			var email = val;
			var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			if(email.length > 0){
				return filter.test(email);
			}
		};
		this.validateNumber = function(e,type) {
			var key;
			var keychar;
			var isShift = false;
			var isCtrl = false;
			if (window.event){
				key = window.event.keyCode;
			}		
			else if (e){
				key = e.which;
			}		
			else{
				return true;
			}	
			keychar = String.fromCharCode(key);
			if (e.ctrlKey){
				isCtrl = true;
			}		
			if (key == 16) {
				isShift = true;
			}		
			/* control keys */
			if ((key === null) || (key === 0) || (key === 8) || (key === 9) || (key === 27) || (key === 37) || (key === 39) || (key === 116) || (key === 13)){
				return true;
			}		
			/* numbers */
			else if ((("0123456789").indexOf(keychar) > -1) && !isShift && !(type==="readonly")){
				return true;
			}
			else if (key>=96 && key<=105 && !(type==="readonly")) {
				return true;
			}else if((key ==16) && (key>36)){
				return true;
			}
			else if ((key == 99) && isCtrl){
				return true;
			}		
			else if ((key == 118) && isCtrl){
				return true;
			}		
			else if ((key == 88) && isCtrl){
				return true;
			}
			else if (key == 46){
				return true;
			}else if(key==8){
				return true;
			}else if(key==35){
				return true;
			}else{
				return false;
			}
		};
		
		this.formatDateRange = function (str) {
			
			var filter = /^\d{2}\/\d{2}\/\d{4}?[\s][-][\s]\d{2}\/\d{2}\/\d{4}$/;
			if(str.length > 0){
				return filter.test(str);
			}
		};
		/**
		 * remove Characters in text box.
		 * @author 
		 */
		this.htmlSpecialChar = function (str) {
			return String(str).replace(/[#~!@$*()+_:"}{,/'[&^`;?%&\\-]|[]]|[a-zA-Z]/g, '');
		};
		
		/**
		 * Create NameSpace.
		 * @author anhtran.
		 */
		this.createNameSpace = function(namespaceString) {
		    var parts = namespaceString.split('.'),
		    parent = window,
		    currentPart = '';
		 
		    for (var i = 0, length = parts.length; i < length; i++) {
		        currentPart = parts[i];
		        parent[currentPart] = parent[currentPart] || {};
		        parent = parent[currentPart];
		    }
		 
		    return parent;
		};
		
		this.getIEVersion = function () {
			var rv = -1;
			   if (navigator.appName == 'Microsoft Internet Explorer')
			   {
			      var ua = navigator.userAgent;
			      var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
			      if (re.exec(ua) != null)
			         rv = parseFloat( RegExp.$1 );
			   }
			   return rv;
		};
		
		this.isNumberKey = function (e){
		    //var charCode = (evt.which) ? evt.which : evt.keyCode;
		    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)){
		    	return false;	
		    }
		    return true;
		  
		};

	};
	
	return Common;
})();
