<%@page contentType="text/html" pageEncoding="UTF-8" import="DAO.*, java.util.*, model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <script>
        var container = document.getElementById("tagID");
        var tag = container.getElementsByClassName("tag");
        var current = container.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        tag[1].className += " active";
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
        <h1 class="text-center text-white display-6"><fmt:message key="shop.shop1"></fmt:message></h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="Home"><fmt:message key="shop.home"></fmt:message></a></li>
            <li class="breadcrumb-item active text-white"><fmt:message key="shop.shop1"></fmt:message></li>
            <li class="breadcrumb-item"><a href="cart.jsp"><fmt:message key="shop.cart"></fmt:message></a></li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Fruits Shop Start-->
    <div class="container-fluid fruite py-5">
        <div class="container py-5">
            <h1 class="mb-4"><fmt:message key="shop.shop2"></fmt:message></h1>
            <div class="row g-4">
                <div class="col-lg-12">
                    <div class="row g-4">
                        <div class="col-xl-3">
                            <div class="input-group w-100 mx-auto d-flex">
                                <input type="search" id="userInput" onkeyup="searchFuntion()" class="form-control p-3" placeholder="<fmt:message key="shop.keyword"></fmt:message>">
                            </div>
                        </div>
                        <div class="col-6"></div>
                    </div>
                    <div class="row g-4">
                        <!--Get all array-->
                    <%
                        ArrayList<Product> list = new ProductDAOImpl().listAllProduct();
                        ArrayList<Product> listTee = new ProductDAOImpl().listAllCategory("Tee");
                        ArrayList<Product> listPant = new ProductDAOImpl().listAllCategory("Pant");
                        ArrayList<Product> listJackdie = new ProductDAOImpl().listAllCategory("Jacket/Hoodie");
                        ArrayList<Product> listAccessories = new ProductDAOImpl().listAllCategory("Accessories");
                    %>
                    <div class="col-lg-3">
                        <div class="row g-4">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <h4><fmt:message key="shop.category"></fmt:message></h4>
                                    <ul class="list-unstyled fruite-categorie">
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#" onclick="productClick(1); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i><fmt:message key="shop.all"></fmt:message></a>
                                                <span>(<%=list.size()%>)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#" onclick="productClick(2); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i><fmt:message key="shop.Tee"></fmt:message></a>
                                                <span>(<%=listTee.size()%>)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#" onclick="productClick(3); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i><fmt:message key="shop.Pant"></fmt:message></a>
                                                <span>(<%=listPant.size()%>)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#" onclick="productClick(4); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i><fmt:message key="shop.Jacket/Hoodie"></fmt:message></a>
                                                <span>(<%=listJackdie.size()%>)</span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="d-flex justify-content-between fruite-name">
                                                <a href="#" onclick="productClick(5); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i><fmt:message key="shop.Accessories"></fmt:message></a>
                                                <span>(<%=listAccessories.size()%>)</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9">
                        <div class="row g-4 justify-content-center">
                            <!--All start-->
                            <jsp:useBean id="product" class="model.Product">
                                <%
                                    for(Product item: list){
                                %>
                                <jsp:setProperty name="product" property="productId" value="<%=item.getProductId()%>"/>
                                <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                <%
                                    String type = "shop." + item.getProductType();
                                %>
                                <div class="col-md-6 col-lg-6 col-xl-4 all" style="display: block">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><fmt:message key="<%=type%>"></fmt:message></div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><jsp:getProperty name="product" property="productName"/></h4>
                                            <p><jsp:getProperty name="product" property="productDescription"/></p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                <%
                                                if(session.getAttribute("currentUser") != null){
                                                %>
                                                <a href="AddToCart?productId=<jsp:getProperty name="product" property="productId"/>" 
                                                   onclick="promt()" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message>
                                                </a>
                                                <%
                                                }
                                                else{
                                                %>
                                                <a href="login.jsp" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="promtFailed()"><i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message></a>
                                                <%
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--All end-->
                                <!--Tee start-->
                                <%
                                    }
                                    for(Product item: listTee){
                                %>
                                <jsp:setProperty name="product" property="productId" value="<%=item.getProductId()%>"/>
                                <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                <%
                                    String type = "shop." + item.getProductType();
                                %>
                                <div class="col-md-6 col-lg-6 col-xl-4 tee" style="display: none">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><fmt:message key="<%=type%>"></fmt:message></div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><jsp:getProperty name="product" property="productName"/></h4>
                                            <p><jsp:getProperty name="product" property="productDescription"/></p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                <%
                                                if(session.getAttribute("currentUser") != null){
                                                %>
                                                <a href="AddToCart?productId=<jsp:getProperty name="product" property="productId"/>" 
                                                   onclick="promt()" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message>
                                                </a>
                                                <%
                                                }
                                                else{
                                                %>
                                                <a href="login.jsp" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="promtFailed()"><i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message></a>
                                                <%
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Tee end-->
                                <!--Pant start-->
                                <%
                                    }
                                    for(Product item: listPant){
                                %>
                                <jsp:setProperty name="product" property="productId" value="<%=item.getProductId()%>"/>
                                <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                <%
                                    String type = "shop." + item.getProductType();
                                %>
                                <div class="col-md-6 col-lg-6 col-xl-4 pant" style="display: none">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                            <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><fmt:message key="<%=type%>"></fmt:message></div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><jsp:getProperty name="product" property="productName"/></h4>
                                            <p><jsp:getProperty name="product" property="productDescription"/></p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                <%
                                                if(session.getAttribute("currentUser") != null){
                                                %>
                                                <a href="AddToCart?productId=<jsp:getProperty name="product" property="productId"/>" 
                                                   onclick="promt()" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message>
                                                </a>
                                                <%
                                                }
                                                else{
                                                %>
                                                <a href="login.jsp" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="promtFailed()"><i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message></a>
                                                <%
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Jacket / Hoodie start-->
                                <%
                                    }
                                    for(Product item: listJackdie){
                                %>
                                <jsp:setProperty name="product" property="productId" value="<%=item.getProductId()%>"/>
                                <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                <%
                                    String type = "shop." + item.getProductType();
                                %>
                                <div class="col-md-6 col-lg-6 col-xl-4 jackdie" style="display: none">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><fmt:message key="<%=type%>"></fmt:message></div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><jsp:getProperty name="product" property="productName"/></h4>
                                            <p><jsp:getProperty name="product" property="productDescription"/></p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                <%
                                                if(session.getAttribute("currentUser") != null){
                                                %>
                                                <a href="AddToCart?productId=<jsp:getProperty name="product" property="productId"/>" 
                                                   onclick="promt()" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message>
                                                </a>
                                                <%
                                                }
                                                else{
                                                %>
                                                <a href="login.jsp" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="promtFailed()"><i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message></a>
                                                <%
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--Jacket / Hoodie end-->
                                <!--Accessories start-->
                                <%
                                    }
                                    for(Product item: listAccessories){
                                %>
                                <jsp:setProperty name="product" property="productId" value="<%=item.getProductId()%>"/>
                                <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                <%
                                    String type = "shop." + item.getProductType();
                                %>
                                <div class="col-md-6 col-lg-6 col-xl-4 accessories" style="display: none">
                                    <div class="rounded position-relative fruite-item">
                                        <div class="fruite-img">
                                            <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                        </div>
                                        <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><fmt:message key="<%=type%>"></fmt:message></div>
                                        <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                            <h4><jsp:getProperty name="product" property="productName"/></h4>
                                            <p><jsp:getProperty name="product" property="productDescription"/></p>
                                            <div class="d-flex justify-content-between flex-lg-wrap">
                                                <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                <%
                                                if(session.getAttribute("currentUser") != null){
                                                %>
                                                <a href="AddToCart?productId=<jsp:getProperty name="product" property="productId"/>" 
                                                   onclick="promt()" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                    <i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message>
                                                </a>
                                                <%
                                                }
                                                else{
                                                %>
                                                <a href="login.jsp" class="btn border border-secondary rounded-pill px-3 text-primary" onclick="promtFailed()"><i class="fa fa-shopping-bag me-2 text-primary"></i> <fmt:message key="shop.tocart"></fmt:message></a>
                                                <%
                                                }
                                                %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </jsp:useBean>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>   

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Javascript -->
<script src="js/main.js">
</script>
<script>
    var all = document.getElementsByClassName('all');
    var tee = document.getElementsByClassName('tee');
    var pant = document.getElementsByClassName('pant');
    var jackdie = document.getElementsByClassName('jackdie');
    var accessories = document.getElementsByClassName('accessories');
    var product = all;
    function productClick(num) {
        for (var i = 0; i < all.length; i += 1) {
            if (num === 1) {
                product = all;
                all[i].style.display = 'block';
            } else
                all[i].style.display = 'none';
        }
        for (var i = 0; i < tee.length; i += 1) {
            if (num === 2) {
                product = tee;
                tee[i].style.display = 'block';
            } else
                tee[i].style.display = 'none';
        }
        for (var i = 0; i < pant.length; i += 1) {
            if (num === 3) {
                product = pant;
                pant[i].style.display = 'block';
            } else
                pant[i].style.display = 'none';
        }
        for (var i = 0; i < jackdie.length; i += 1) {
            if (num === 4) {
                product = jackdie;
                jackdie[i].style.display = 'block';
            } else
                jackdie[i].style.display = 'none';
        }
        for (var i = 0; i < accessories.length; i += 1) {
            if (num === 5) {
                product = accessories;
                accessories[i].style.display = 'block';
            } else
                accessories[i].style.display = 'none';
        }
    }

    //search function
    function searchFuntion() {
        var input = document.getElementById('userInput');
        var filter = input.value.toUpperCase();
        var a, b, txtValue, txtValue2;

        for (var i = 0; i < product.length; i++) {
            a = product[i].getElementsByTagName("h4")[0];
            b = product[i].getElementsByTagName("p")[0];
            txtValue = a.textContent || a.innerText;
            txtValue2 = b.textContent || b.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1)
                product[i].style.display = 'block';
            else
                product[i].style.display = 'none';
        }
    }

    function promt() {
        window.alert("Successful!");
    }
    
    function promtFailed(){
        window.alert("Please login first!");
    }
</script>
</body>
</html>