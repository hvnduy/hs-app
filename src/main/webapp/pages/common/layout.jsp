<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<tiles:importAttribute name="favicon" />
<c:forEach items="${favicon}" var="fav">
	<link href="<c:url value='${fav}' />" rel="shortcut icon">
</c:forEach>
<tiles:importAttribute name="stylesInherit" />

<c:forEach items="${stylesInherit}" var="style">
	<link href="<c:url value='${style}' />" rel="stylesheet"
		type="text/css" />
</c:forEach>

<!--[if IE 7]>
	  <link rel="stylesheet" href="../../style/font-awesome-ie7.min.css" />
	<![endif]-->

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
	<script src="../../script/html5shiv.js"></script>
	<script src="../../script/respond.min.js"></script>
	<![endif]-->

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/jquery-ui/jquery-ui.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/jquery-ui/jquery.ui.autocomplete.css" />
<script src="<%=request.getContextPath()%>/script/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/script/jquery-ui/jquery-ui.js"></script>
<script
	src="<%=request.getContextPath()%>/script/jquery-ui/jquery.ui.autocomplete.js"></script>
<style>
.ui-autocomplete {
	z-index: 9999 !important;
}
</style>
</head>
<body>

	<div id="fb-root"></div>
	<script>
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	
	<tiles:insertAttribute name="header" />
	<section id="ccr-main-section">
	<div class="container">
		<tiles:insertAttribute name="leftSection" />
		<tiles:insertAttribute name="rightSection" />
	</div><!-- /.container -->
	</section><!-- / #ccr-main-section -->
	<tiles:insertAttribute name="footerSidebar" />
	<tiles:insertAttribute name="footer" />

	<tiles:importAttribute name="scriptsInherit" />
	<c:forEach items="${scriptsInherit}" var="script">
		<script type="text/javascript" src="<c:url value='${script}' />"></script>
	</c:forEach>
	<tiles:importAttribute name="scripts" />
	<c:forEach items="${scripts}" var="script">
		<script type="text/javascript" src="<c:url value='${script}' />"></script>
	</c:forEach>
	<script type="text/javascript">
		
	</script>
</body>
</html>
