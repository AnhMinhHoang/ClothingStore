<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <jsp:include page="header.jsp"></jsp:include>

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
    <!-- Single Page Header start -->
    <div class="container-fluid page-header py-5">
        <h1 class="text-center text-white display-6"><fmt:message key="error.error"></fmt:message></h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="Home"><fmt:message key="error.home"></fmt:message></a></li>
                <li class="breadcrumb-item active text-white">404</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- 404 Start -->
        <div class="container-fluid py-5">
            <div class="container py-5 text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <i class="bi bi-exclamation-triangle display-1 text-secondary"></i>
                        <h1 class="display-1">404</h1>
                        <h1 class="mb-4"><fmt:message key="error.pageError"></fmt:message></h1>
                    <p class="mb-4"><fmt:message key="error.diag"></fmt:message></p>
                    <a class="btn border-secondary rounded-pill py-3 px-5" href="index.html"><fmt:message key="error.back"></fmt:message></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 404 End -->
    <jsp:include page="footer.jsp"></jsp:include>

