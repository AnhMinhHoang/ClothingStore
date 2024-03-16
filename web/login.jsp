<%@ page pageEncoding="UTF-8" contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="header.jsp"></jsp:include>
<script>
            var container = document.getElementById("tagID");
            var current = container.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
</script>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3" style="margin-top: 200px" >
                    <div class="card-body p-4 p-sm-5">
                        <h5 class="card-title text-center mb-5 fw-light fs-5">Login</h5>
                    <c:if test="${not empty errorMessage}">
                        <p style="color:red">${errorMessage}</p>
                    </c:if>
                        
                    <%
                        String email = "", pass = "", remember = "";
                        Cookie[] cookies = request.getCookies();
                        if(cookies != null){
                            for(Cookie cookie: cookies){
                                if(cookie.getName().equals("cookieEmail")){
                                    email = cookie.getValue();
                                }
                                else if(cookie.getName().equals("cookiePass")){
                                    pass = cookie.getValue();
                                }
                                else if(cookie.getName().equals("cookieRemember")){
                                    remember = cookie.getValue();
                                }
                            }
                        }
                    %>
                    
                    <form action="login" method="POST">
                        
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="email" placeholder="Email" name="email" value="<%=email%>">
                            <label for="email">Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" name="password" class="form-control" id="floatingPassword" value="<%=pass%>" placeholder="Password">
                            <label for="floatingPassword">Password</label>
                        </div>

                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="1" 
                                   <%= "1".equals(remember)? "checked='/checked'" : ""%> name="remember" id="rememberPasswordCheck">
                            <label class="form-check-label" for="term">
                                Remember Password
                            </label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">Login</button>
                        </div>
                        <hr class="my-4">
                        <div>
                            <span>Don't have account?</span><a href="register.jsp"> Register here!</a>
                        </div>                     
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

