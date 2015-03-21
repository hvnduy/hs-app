<%@page import="org.springframework.security.core.userdetails.User"%>
<%@page import="com.mag.enterprise.mass.model.vo.MASSadminUsersModel"%>
<%@page import="com.mag.enterprise.mass.utils.ConstantsWeb"%>
<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%
// 	org.springframework.security.core.Authentication auth = org.springframework.security.core.context.SecurityContextHolder
// 			.getContext().getAuthentication();
// 	MASSadminUsersModel u = (MASSadminUsersModel) auth.getPrincipal();
%>

<nav class="navbar navbar-default" role="navigation" id="header">
	<div class="container-fluid middle">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header navtop">
			<button type="button"
				class="btn btn-default dropdown-toggle glyphicon glyphicon-th"
				data-toggle="dropdown" aria-expanded="false">Home</button>
			<ul class="dropdown-menu multi-level" role="menu"
				aria-labelledby="dropdownMenu">
				<li class="dropdown-submenu"><a tabindex="-1" href="#">Order/Import</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Order Entry</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Import Truition Orders</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Import Canadian</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Import Product Template</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Export to JDE-OOR</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Export to JDE-SB20</a></li>
					</ul></li>
				<li class="divider"></li>
				<li class="dropdown-submenu"><a tabindex="-1" href="#">View</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Receiving Queue</a></li>
					</ul></li>
				<li class="divider"></li>
				<li class="dropdown-submenu"><a tabindex="-1" href="#">Issue
						Form</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Credit Request</a></li>
					</ul></li>
				<li class="divider"></li>
				<li class="dropdown-submenu"><a tabindex="-1" href="#">Inventory</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">Inventory List</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Inventory Search</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Inventory Export</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Update SKU Price/Status</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Inventory Mass Update</a></li>
					</ul></li>
				<li class="divider"></li>
				<li class="dropdown-submenu"><a tabindex="-1" href="#">Report</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1" href="#">RF Fee Report</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Daily Asset Report</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#">Store Order Export</a></li>
					</ul></li>
				<li class="divider"></li>
				<li><a href="#">Setting</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse">
			<ul id="sectionLogin" class="nav navbar-right">
				<c:if test="${pageContext.request.userPrincipal.name != null}">
					<li id="userLogged">
						<h3>${pageContext.request.userPrincipal.name}</h3>
					</li>
				</c:if>
				<li><a href="<s:url value="/logout"></s:url>">Logout</a></li>
			</ul>
		</div>
	</div>
	<!-- /.container-fluid -->
</nav>

<script>
  var contextPath = '<%=request.getContextPath()%>';
	var languageCode = '${pageContext.response.locale}';
</script>
