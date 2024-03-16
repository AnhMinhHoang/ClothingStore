<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" import="DAO.*, java.util.*, model.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"></jsp:include>

    <script>
        var container = document.getElementById("tagID");
        var tag = container.getElementsByClassName("tag");
        var current = container.getElementsByClassName("active");
        current[0].className = current[0].className.replace(" active", "");
        tag[2].className += " active";
    </script>
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
        <h1 class="text-center text-white display-6">Cart</h1>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">Pages</a></li>
            <li class="breadcrumb-item active text-white">Cart</li>
        </ol>
    </div>
    <!-- Single Page Header End -->


    <!-- Cart Page Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Products</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Total</th>

                        </tr>
                    </thead>
                    <tbody>
                    <jsp:useBean id="bill" class="model.Bill">
                        <%
                            if(session.getAttribute("currentUser") != null){
                            ArrayList<Bill> list = new ProductDAOImpl().getAllUserCart((Integer)session.getAttribute("userID"));
                            if(list.size() > 0){
                        %>
                        <jsp:setProperty name="bill" property="allTotal" value="<%=list.get(0).getAllTotal()%>"/>
                        <%
                            for(Bill item: list){
                        %>
                        <jsp:setProperty name="bill" property="productImg" value="<%=item.getProductImg()%>"/>
                        <jsp:setProperty name="bill" property="productName" value="<%=item.getProductName()%>"/>
                        <jsp:setProperty name="bill" property="productPrice" value="<%=item.getProductPrice()%>"/>
                        <jsp:setProperty name="bill" property="quantity" value="<%=item.getQuantity()%>"/>
                        <jsp:setProperty name="bill" property="total" value="<%=item.getTotal()%>"/>
                        <tr>
                            <th scope="row">
                                <div class="d-flex align-items-center">
                                    <img src="<jsp:getProperty name="bill" property="productImg"/>" class="img-fluid me-5 rounded-circle" style="width: 80px; height: 80px;" alt="">
                                </div>
                            </th>
                            <td>
                                <p class="mb-0 mt-4"><jsp:getProperty name="bill" property="productName"/></p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4"><jsp:getProperty name="bill" property="productPrice"/></p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4"><jsp:getProperty name="bill" property="quantity"/></p>
                            </td>
                            <td>
                                <p class="mb-0 mt-4"><jsp:getProperty name="bill" property="total"/></p>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="row g-4 justify-content-end">
                <div class="col-8"></div>
                <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                    <div class="bg-light rounded">
                        <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                            <h5 class="mb-0 ps-4 me-4">Total:</h5>
                            <p class="mb-0 pe-4"><jsp:getProperty name="bill" property="allTotal"/></p>
                        </div>
                        <form action="Purchase" method="GET">
                            <input onclick="confirm()" type="submit" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" value="Purchase"/>
                        </form>
                    </div>
                </div>
            </div>
            <%
                }
                else{
            %>
                    </table>
                </div>
                <div class="row g-4 justify-content-end">
                    <div class="col-8"></div>
                    <div class="col-sm-8 col-md-7 col-lg-6 col-xl-4">
                        <div class="bg-light rounded">
                            <div class="py-4 mb-4 border-top border-bottom d-flex justify-content-between">
                                <h5 class="mb-0 ps-4 me-4">Total:</h5>
                            </div>
                            <button onclick="failed()" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4 ms-4" type="button">Purchase</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <%
                }
            }
            %>
        </div>
    </div>
    <!-- Cart Page End -->
</jsp:useBean>
<jsp:include page="footer.jsp"></jsp:include>   
<!-- JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/waypoints/waypoints.min.js"></script>
<script src="lib/lightbox/js/lightbox.min.js"></script>
<script src="lib/owlcarousel/owl.carousel.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
</body>
<script>
    function confirm() {
        window.alert("Purchase successful!");
    }
    
    function failed(){
        window.alert("Purchase failed! Nothing in your cart!");
    }
</script>
</html>