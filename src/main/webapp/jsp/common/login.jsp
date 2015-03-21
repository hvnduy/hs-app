<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<span id="title-span-for-check-login-page"></span>
<div class="container-fluid">
	<div class="row-fluid">
		<div class="login-header">
		</div>
		<div class="login-fm">
			<c:if test="${showLogout}">
			    <div class="infoBox ui-state-highlight">
			        <p>
			            <span class="floatLeft ui-icon ui-icon-info"></span>
			            You have been successfully logged out.
			        </p>
			    </div>
			</c:if>
			<!-- If login has failed for any number of reasons the user will return to the login screen and an error message will display -->
			<!-- The login form is two text boxes and a button and the text boxes are connected to ldap through Spring Security -->
			<div class='err-message'>
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION.message}">
				    <div class="infoBox ui-state-error">
				    	<div>
					        <p>Your login attempt was unsuccessful. Please try again.</p>
					        <p>Cause: <c:out value='${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}' /></p>
					    </div>
				    </div>
				</c:if>
			</div>
			
			<form name="f" action="/mass/j_spring_security_check" method="POST" class="form-signin" role="form">
				<div class="welcome-heading">
					Welcome, Please login.
				</div>
                <label for="j_username" class="sr-only">Email address</label>
				<input type="text" id="j_username" name="j_username" value="" class="form-control" placeholder="User Name" required="true" autofocus="true">
				<label for="password" class="sr-only">Password</label>
				<input type="password" name="j_password" id="password" class="form-control" placeholder="Password" required="">
				<div class="checkbox">
		          <label>
		            <input type="checkbox" id="j_remember" name="_spring_security_remember_me"> Remember me
		          </label>
		          <a href="#" style="float: right;">Forgot your password?</a>
		        </div>
				<button class="btn btn-lg btn-login btn-block" name="submit" type="submit">Login</button>
			</form>
		</div>
		<div class="text-center container-fluid footer-login">
			<p class="text-center">©MagRabbit 2015 All Rights Reserved</p>
		</div>

	</div>
</div>