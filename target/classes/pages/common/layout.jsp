<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
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
	<tiles:importAttribute name="styles" />
	<c:forEach items="${styles}" var="style">
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

<!-- <link rel="stylesheet" -->
<%-- 	href="<%=request.getContextPath()%>/style/jquery-ui/jquery-ui.css" /> --%>
<%-- <script --%>
<%-- 	src="<%=request.getContextPath()%>/script/jquery-ui/jquery-ui.js"></script> --%>
</head>
<body>
	<section id="container">
		<tiles:insertAttribute name="header" />

		<tiles:insertAttribute name="navigation" />

		<tiles:insertAttribute name="body" />
		<tiles:insertAttribute name="footer" />

	</section>
	<tiles:importAttribute name="scriptsInherit" />
	<c:forEach items="${scriptsInherit}" var="script">
		<script type="text/javascript" src="<c:url value='${script}' />"></script>
	</c:forEach>
	<script class="include" type="text/javascript" src="<%=request.getContextPath()%>/script/jquery.dcjqaccordion.2.7.js"></script>
	<tiles:importAttribute name="scripts" />
	<c:forEach items="${scripts}" var="script">
		<script type="text/javascript" src="<c:url value='${script}' />"></script>
	</c:forEach>
</body>
</html>
