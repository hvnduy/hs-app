<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:importAttribute name="scriptsInherit" />
<c:forEach items="${scriptsInherit}" var="script">
    <script type="text/javascript" src="<c:url value='${script}' />"></script>
</c:forEach>

<script type="text/javascript"> 
    $(document).ready(function() {
        $("#viewError").click(function(){
            if($("#message").hasClass("hide")){
                $("#message").removeClass("hide").addClass("show");
                $("#message").show();
            }else{
                $("#message").removeClass("show").addClass("hide");
                $("#message").hide();
            }
        });
        
    });
</script>
<h2><s:message code="defaultErrorMessage" /></h2>

<a id="viewError" href="javascript:void(0)">See more details</a>
<div id="message" class="hide" style="display:none">${errDetal}</div>

