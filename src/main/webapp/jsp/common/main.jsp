<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate">
<meta http-equiv="Expires" content="0">


<title><tiles:insertAttribute name="title" /></title>

<tiles:importAttribute name="stylesInherit" />
<c:forEach items="${stylesInherit}" var="style">
	<link href="<c:url value='${style}' />" rel="stylesheet"
		type="text/css" />
</c:forEach>

<tiles:importAttribute name="styles" />
<c:forEach items="${styles}" var="style">
	<link href="<c:url value='${style}' />" rel="stylesheet"
		type="text/css" />
</c:forEach>

<tiles:importAttribute name="favicon" />
<c:forEach items="${favicon}" var="fav">
	<link href="<c:url value='${fav}' />" rel="shortcut icon">
</c:forEach>

	<!--[if IE 7]>
	  <link rel="stylesheet" href="../../style/font-awesome-ie7.min.css" />
	<![endif]-->
	
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
	
	<!--[if lt IE 9]>
	<script src="../../script/html5shiv.js"></script>
	<script src="../../script/respond.min.js"></script>
	<![endif]-->

	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/jquery-ui/jquery-ui.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/style/jquery-ui/jquery.ui.autocomplete.css" />
	<script src="<%=request.getContextPath()%>/script/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/script/jquery-ui/jquery-ui.js"></script>
	<script src="<%=request.getContextPath()%>/script/jquery-ui/jquery.ui.autocomplete.js"></script>
	<style>
		.ui-autocomplete {
			 z-index: 9999 !important;
		}
	</style>
</head>

<body>
	<div id="wrap">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="body" ignore="true" />
		<div>&nbsp;</div>
		<tiles:insertAttribute name="footer" />
	</div>	
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	<div class="modal" id="unlockDialog" tabindex="-1" role="dialog" aria-labelledby="unlockDialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 30%">
	        <div class="modal-content">
				<input type="hidden" value="" id="unlockOrderId"/>
				<div class="modal-header header-default">
					<button type="button" class="close" data-dismiss="modal" style="font-size: 30px" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
							<strong><s:message code="print.popupText.unlockOrder.title"/></strong>
						</h4>
				</div>
	            <div class="modal-body form-horizontal">
	            	<div class="form-group">
					    <label class="col-sm-3 control-label">Assignee</label>
					    <div class="col-sm-9">
					    	<input type="hidden" id="adminIdHidden" value="${pageContext.request.userPrincipal.name}"/>
							<input type="hidden" id="assignToHidden"/>
					      <input type="text" class="form-control" name="assignTo" id="assignToId" value="${pageContext.request.userPrincipal.name}">
					    </div>
					</div>
					<h4 style="text-align: right; margin-top: 5px;">
						<button type="button" class="btn btn-primary" onclick="assignToUser()" >
							<span class="glyphicon glyphicon-ok"></span> <s:message code="common.ok"/>
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-repeat"></span> <s:message code="common.cancel"/>
						</button>
					</h4>
	            </div><!-- / .modal-body -->
	        </div><!-- / .modal-content -->
	    </div><!-- / .modal-dialog -->		
	</div><!-- / .modal -->
	</sec:authorize>
</body>

<tiles:importAttribute name="scriptsInherit" />
<c:forEach items="${scriptsInherit}" var="script">
	<script type="text/javascript" src="<c:url value='${script}' />"></script>
</c:forEach>
<tiles:importAttribute name="scripts" />
<c:forEach items="${scripts}" var="script">
	<script type="text/javascript" src="<c:url value='${script}' />"></script>
</c:forEach>
<script type="text/javascript">
	var roleViewAccess = false;
	<sec:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_POWER', 'ROLE_USER')">
		roleViewAccess=true;
	</sec:authorize>
		
	function unclockAdmin(ordId,status){
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		if(status!='COMPL'){
			$('#assignToId').val($('#adminIdHidden').val());
			$('#unlockOrderId').val(ordId);
			$("#unlockDialog").modal({
				keyboard : true,
				backdrop : "static",
				show : true
			});
		}
		</sec:authorize>
	}
	
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
	function assignToUser() {
		if ($('#assignToId').val()!= "") {
			$.ajax({
				type : 'POST',
				url : window.location.protocol + "//" + window.location.host + '<%=request.getContextPath()%>/assignTo',
				data : {
					orderId: $('#unlockOrderId').val(),
					assignTo: $('#assignToId').val()
				},
				success : function(response) {
					if (verifySessionForAjax(response)) {
						if(response=='Username not found'){
							showErrorDialog('No match.');
						}else{
							window.location.reload();
						}
					}
				}
			});
		} else {
			showErrorDialog('No match.');
		}
	}
	
	$('#assignToId').autocomplete({
		source: window.location.protocol + "//" + window.location.host + "<%=request.getContextPath()%>/autoCompleteUserLDAP",
		minLength: 3,
		delay: 100,
		search  : function(){$(this).attr('readonly',true);$(this).addClass('autocomplete_load');},
		response: function(){$(this).attr('readonly',false);$(this).removeClass('autocomplete_load');},
		select: function( event, ui ) {									
			$('#assignToHidden').val(ui.item.userId);
		},
		close: function( event, ui ) {									
			$('#assignToId').val($('#assignToHidden').val());									
		}
	}).blur(function(){
		$('#assignToId').val($('#assignToHidden').val());		
	});
	</sec:authorize>
</script>
</html>
