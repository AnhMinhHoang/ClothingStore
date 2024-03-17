<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
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
    <div class="container py-5">
        <div class="row g-5" style="
             align-items: center;
             padding-left: 100px;
             justify-content: center;">
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3"><fmt:message key="footer.shopinfo"></fmt:message></h4>
                    <a class="btn-link" href=""><fmt:message key="footer.about"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.contact"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.privacy"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.terms"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.return"></fmt:message></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="d-flex flex-column text-start footer-item">
                    <h4 class="text-light mb-3"><fmt:message key="footer.account"></fmt:message></h4>
                    <a class="btn-link" href=""><fmt:message key="footer.account2"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.shop"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.shopcart"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.wishlist"></fmt:message></a>
                    <a class="btn-link" href=""><fmt:message key="footer.orderhistory"></fmt:message></a>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="footer-item">
                    <h4 class="text-light mb-3"><fmt:message key="footer.contact2"></fmt:message></h4>
                    <p><fmt:message key="footer.address"></fmt:message></p>
                    <p>Email: PRJ_2004@gmail.com</p>
                    <p><fmt:message key="footer.phone"></fmt:message></p>

                </div>
            </div>
        </div>
    </div>
</div>

<a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>


<script src="js/main.js"></script>
</body>