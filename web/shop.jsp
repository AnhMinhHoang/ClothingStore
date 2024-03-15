<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" import="DAO.*, java.util.*, model.*"%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Fashionable Clothing for GenZ</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="#" class="text-white">123 Street, New York</a></small>
                        <small class="me-3"><i class="fas fa-envelope me-2 text-secondary"></i><a href="#" class="text-white">Email@Example.com</a></small>
                    </div>
                    <div class="top-link pe-2">
                        <a href="#" class="text-white"><small class="text-white mx-2">Privacy Policy</small>/</a>
                        <a href="#" class="text-white"><small class="text-white mx-2">Terms of Use</small>/</a>
                        <a href="#" class="text-white"><small class="text-white ms-2">Sales and Refunds</small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.jsp" class="navbar-brand"><h1 class="text-primary display-6">Genz Clothing</h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <a href="index.jsp" class="nav-item nav-link">Home</a>
                            <a href="shop.jsp" class="nav-item nav-link active">Shop</a>
                            <a href="shop-detail.jsp" class="nav-item nav-link">Shop Detail</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.jsp" class="dropdown-item">Cart</a>
                                    <a href="chackout.jsp" class="dropdown-item">Chackout</a>
                                    <a href="testimonial.jsp" class="dropdown-item">Testimonial</a>
                                    <a href="404.jsp" class="dropdown-item">404 Page</a>
                                </div>
                            </div>
                            <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                        </div>
                        <div class="d-flex m-3 me-0">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4" data-bs-toggle="modal" data-bs-target="#searchModal"><i class="fas fa-search text-primary"></i></button>
                            <a href="#" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;">3</span>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Modal Search Start -->
        <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen">
                <div class="modal-content rounded-0">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Search by keyword</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body d-flex align-items-center">
                        <div class="input-group w-75 mx-auto d-flex">
                            <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1">
                            <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal Search End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop</h1>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="#">Home</a></li>
                <li class="breadcrumb-item"><a href="#">Pages</a></li>
                <li class="breadcrumb-item active text-white">Shop</li>
            </ol>
        </div>
        <!-- Single Page Header End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <h1 class="mb-4">Fresh fruits shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex">
                                    <input type="search" id="userInput" onkeyup="searchFuntion()" class="form-control p-3" placeholder="keywords">
                                </div>
                            </div>
                            <div class="col-6"></div>
<!--                            <div class="col-xl-3">
                                <div class="bg-light ps-3 py-3 rounded d-flex justify-content-between mb-4">
                                    <label for="fruits">Default Sorting:</label>
                                    <select id="sortOption" name="fruitlist" onchange="onChange()" class="border-0 form-select-sm bg-light me-3" form="fruitform">
                                        <option value="Nothing">Nothing</option>
                                        <option value="priceUp">Price Up</option>
                                        <option value="priceDown">Price Down</option>
                                    </select>   
                                </div>
                            </div>-->
                        </div>
                        <div class="row g-4">
                            <!--Get all array-->
                            <%
                                ArrayList<Product> list = new ProductDAOImpl().listAllProduct();
                                ArrayList<Product> listTee = new ProductDAOImpl().listAllCategory("Tee");
                                ArrayList<Product> listPant = new ProductDAOImpl().listAllCategory("Pant");
                                ArrayList<Product> listJackdie = new ProductDAOImpl().listAllCategory("Jacket / Hoodie");
                                ArrayList<Product> listAccessories = new ProductDAOImpl().listAllCategory("Accessories");
                            %>
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#" onclick="productClick(1); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i>All</a>
                                                        <span>(<%=list.size()%>)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#" onclick="productClick(2); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i>Tee</a>
                                                        <span>(<%=listTee.size()%>)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#" onclick="productClick(3); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i>Pant</a>
                                                        <span>(<%=listPant.size()%>)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#" onclick="productClick(4); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i>Jacket / Hoodie</a>
                                                        <span>(<%=listJackdie.size()%>)</span>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#" onclick="productClick(5); event.preventDefault();"><i class="fas fa-apple-alt me-2"></i>Accessories</a>
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
                                        <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                        <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                        <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                        <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                        <jsp:setProperty name="product" property="productType" value="<%=item.getProductType()%>"/>
                                        <div class="col-md-6 col-lg-6 col-xl-4 all" style="display: block">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><jsp:getProperty name="product" property="productType"/></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><jsp:getProperty name="product" property="productName"/></h4>
                                                    <p><jsp:getProperty name="product" property="productDescription"/></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
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
                                        <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                        <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                        <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                        <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                        <jsp:setProperty name="product" property="productType" value="<%=item.getProductType()%>"/>
                                        <div class="col-md-6 col-lg-6 col-xl-4 tee" style="display: none">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><jsp:getProperty name="product" property="productType"/></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><jsp:getProperty name="product" property="productName"/></h4>
                                                    <p><jsp:getProperty name="product" property="productDescription"/></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
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
                                        <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                        <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                        <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                        <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                        <jsp:setProperty name="product" property="productType" value="<%=item.getProductType()%>"/>
                                        <div class="col-md-6 col-lg-6 col-xl-4 pant" style="display: none">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><jsp:getProperty name="product" property="productType"/></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><jsp:getProperty name="product" property="productName"/></h4>
                                                    <p><jsp:getProperty name="product" property="productDescription"/></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--Jacket / Hoodie start-->
                                        <%
                                            }
                                            for(Product item: listJackdie){
                                        %>
                                        <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                        <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                        <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                        <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                        <jsp:setProperty name="product" property="productType" value="<%=item.getProductType()%>"/>
                                        <div class="col-md-6 col-lg-6 col-xl-4 jackdie" style="display: none">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><jsp:getProperty name="product" property="productType"/></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><jsp:getProperty name="product" property="productName"/></h4>
                                                    <p><jsp:getProperty name="product" property="productDescription"/></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
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
                                        <jsp:setProperty name="product" property="productName" value="<%=item.getProductName()%>"/>
                                        <jsp:setProperty name="product" property="productPrice" value="<%=item.getProductPrice()%>"/>
                                        <jsp:setProperty name="product" property="productImg" value="<%=item.getProductImg()%>"/>
                                        <jsp:setProperty name="product" property="productDescription" value="<%=item.getProductDescription()%>"/>
                                        <jsp:setProperty name="product" property="productType" value="<%=item.getProductType()%>"/>
                                        <div class="col-md-6 col-lg-6 col-xl-4 accessories" style="display: none">
                                            <div class="rounded position-relative fruite-item">
                                                <div class="fruite-img">
                                                    <img src="<jsp:getProperty name="product" property="productImg"/>" class="img-fluid w-100 rounded-top" alt="">
                                                </div>
                                                <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px; left: 10px;"><jsp:getProperty name="product" property="productType"/></div>
                                                <div class="p-4 border border-secondary border-top-0 rounded-bottom">
                                                    <h4><jsp:getProperty name="product" property="productName"/></h4>
                                                    <p><jsp:getProperty name="product" property="productDescription"/></p>
                                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                                        <p class="text-dark fs-5 fw-bold mb-0"><jsp:getProperty name="product" property="productPrice"/> VND</p>
                                                        <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                        <!--Accessories end-->
                                    </jsp:useBean>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5) ;">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
                                <h1 class="text-primary mb-0">Genz Clothings</h1>
                                <p class="text-secondary mb-0">Fashionable Style</p>
                            </a>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mx-auto">
                                <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email">
                                <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white" style="top: 0; right: 0;">Subscribe Now</button>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="d-flex justify-content-end pt-3">
                                <a class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-outline-secondary me-2 btn-md-square rounded-circle" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-outline-secondary btn-md-square rounded-circle" href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Why People Like us!</h4>
                            <p class="mb-4">typesetting, remaining essentially unchanged. It was 
                                popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.</p>
                            <a href="" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Shop Info</h4>
                            <a class="btn-link" href="">About Us</a>
                            <a class="btn-link" href="">Contact Us</a>
                            <a class="btn-link" href="">Privacy Policy</a>
                            <a class="btn-link" href="">Terms & Condition</a>
                            <a class="btn-link" href="">Return Policy</a>
                            <a class="btn-link" href="">FAQs & Help</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="d-flex flex-column text-start footer-item">
                            <h4 class="text-light mb-3">Account</h4>
                            <a class="btn-link" href="">My Account</a>
                            <a class="btn-link" href="">Shop details</a>
                            <a class="btn-link" href="">Shopping Cart</a>
                            <a class="btn-link" href="">Wishlist</a>
                            <a class="btn-link" href="">Order History</a>
                            <a class="btn-link" href="">International Orders</a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="footer-item">
                            <h4 class="text-light mb-3">Contact</h4>
                            <p>Address: 1429 Netus Rd, NY 48247</p>
                            <p>Email: Example@gmail.com</p>
                            <p>Phone: +0123 4567 8910</p>
                            <p>Payment Accepted</p>
                            <img src="img/payment.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->

        <!-- Copyright Start -->
        <div class="container-fluid copyright bg-dark py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                        <span class="text-light"><a href="#"><i class="fas fa-copyright text-light me-2"></i>Your Site Name</a>, All right reserved.</span>
                    </div>
                    <div class="col-md-6 my-auto text-center text-md-end text-white">
                        <!--/*** This template is free as long as you keep the below authorâs credit link/attribution link/backlink. ***/-->
                        <!--/*** If you'd like to use the template without the below authorâs credit link/attribution link/backlink, ***/-->
                        <!--/*** you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". ***/-->
                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a class="border-bottom" href="https://themewagon.com">ThemeWagon</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Copyright End -->



        <!-- Back to Top -->


        <!-- JavaScript Libraries -->
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
                var a, txtValue;

                for (var i = 0; i < product.length; i++) {
                    a = product[i].getElementsByTagName("h4")[0];
                    txtValue = a.textContent || a.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1)
                        product[i].style.display = 'block';
                    else
                        product[i].style.display = 'none';
                }
            }
        </script>
    </body>
</html>