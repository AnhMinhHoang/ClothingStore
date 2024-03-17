<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script>
        var container = document.getElementById("tagID");
        var current = container.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
    </script>

<%
    String url = request.getRequestURL().toString();
    url = url.replaceAll("^(.*?)(?=[a-zA-Z0-9]+\\.jsp)", "");
    String theLocale = (String)session.getAttribute("language");
    if(theLocale == null){
        theLocale = "en_AU";
        session.setAttribute("language", theLocale);
    }
%>
<fmt:setLocale value="<%=theLocale%>"/>
<fmt:setBundle basename="lang.language"/>
<div class="container">
    <div class="row">
        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
            <div class="card border-0 shadow rounded-3" style="margin-top: 200px" >
                <div class="card-body p-4 p-sm-5">
                    <h5 class="card-title text-center mb-5 fw-light fs-5"><fmt:message key="register.register"></fmt:message></h5>
                    <c:if test="${not empty errorMessage}">
                        <p style="color:red"><fmt:message key="${errorMessage}"></fmt:message></p>
                    </c:if>
                    <c:if test="${not empty successMessage}">
                        <p style="color:green"><fmt:message key="${successMessage}"></fmt:message></p>
                    </c:if>
                    <form action="registers" method="GET">
                        <!-- register ne` -->
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="First name" name="firstName">
                            <label for="floatingInput"><fmt:message key="register.first"></fmt:message></label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="floatingInput" placeholder="Last name" name="lastName">
                            <label for="floatingInput"><fmt:message key="register.last"></fmt:message></label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" oninvalid= "this.setCustomValidity('<fmt:message key="register.email"></fmt:message>')" oninput="setCustomValidity('')" class="form-control" id="email" placeholder="Email" name="email">
                            <label for="email">Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="password" class="form-control" id="floatingPassword" placeholder="Password">
                            <label for="floatingPassword"><fmt:message key="register.password"></fmt:message></label>
                        </div>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="" name="agreed" id="rememberPasswordCheck">
                            <label class="form-check-label" for="term">
                                <fmt:message key="register.term"></fmt:message>
                            </label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit"><fmt:message key="register.register2"></fmt:message></button>
                        </div>
                        <hr class="my-4">
                        <div>
                            <span><fmt:message key="register.check"></fmt:message></span><a href="login.jsp"> <fmt:message key="register.login"></fmt:message></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

