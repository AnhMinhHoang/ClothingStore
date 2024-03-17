<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8" import="DAO.*, java.util.*, model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <head>
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
        <meta charset="utf-8">
        <title><fmt:message key="header.title"></fmt:message></title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap" rel="stylesheet"> 
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>

        <div class="container-fluid fixed-top">
            <div class="container topbar bg-primary d-none d-lg-block">
                <div class="d-flex justify-content-between">
                    <div class="top-info ps-2">
                        <small class="me-3"><i class="fas fa-map-marker-alt me-2 text-secondary"></i> <a href="https://dnuni.fpt.edu.vn" target="_blank" class="text-white"><fmt:message key="header.university"></fmt:message></small>
                    </div>
                    <%
                        if(session.getAttribute("userEmail") != null){
                            User user = (User)session.getAttribute("currentUser");
                            String name = user.getLastName()+" "+user.getFirstName();
                    %>
                    <div class="top-info ps-2">
                       <a class="text-white"> <small class="me-3"><fmt:message key="header.welcome"></fmt:message> <%=name%>!</small>
                    </div>
                    <%
                        }
                    %> 
                    <div class="top-link pe-2">
                        <a href="languageControl?url=<%=url%>&locale=<%=theLocale%>" class="text-white"><small class="text-white mx-2"><fmt:message key="header.language"></fmt:message></small></a>
                    </div>
                </div>
            </div>
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="index.jsp" class="navbar-brand"><h1 class="text-primary display-6"><fmt:message key="header.shopName"></fmt:message></h1></a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse">
                        <div class="navbar-nav mx-auto" id="tagID">
                            <a href="index.jsp" class="nav-item nav-link tag active"><fmt:message key="header.home"></fmt:message></a>
                            <a href="shop.jsp" class="nav-item nav-link tag"><fmt:message key="header.shop"></fmt:message></a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle tag" data-bs-toggle="dropdown"><fmt:message key="header.pages"></fmt:message></a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <a href="cart.jsp" class="dropdown-item"><fmt:message key="header.cart"></fmt:message></a>
                                </div>
                            </div>
                            <a href="503.jsp" class="nav-item nav-link tag"><fmt:message key="header.contact"></fmt:message></a>
                        </div>
                        <div class="d-flex m-3 me-0" id="tagID2">
                            <%
                                if(session.getAttribute("currentUser") == null){
                            %>
                            <a href="login.jsp" class="nav-link active mx-2 tag2"><fmt:message key="header.login"></fmt:message></a>
                            <a href="register.jsp" class="nav-link active mx-2 tag2"><fmt:message key="header.register"></fmt:message></a>
                            <%
                                }
                            else{
                                ArrayList<Bill> list = new ProductDAOImpl().getAllUserCart((Integer)session.getAttribute("userID"));  
                            %>
                            <a href="cart.jsp" class="position-relative me-4 my-auto">
                                <i class="fa fa-shopping-bag fa-2x"></i>
                                <span class="position-absolute bg-secondary rounded-circle d-flex align-items-center justify-content-center text-dark px-1" style="top: -5px; left: 15px; height: 20px; min-width: 20px;"><%=list.size()%></span>
                            </a>
                            <a href="#" class="my-auto">
                                <i class="fas fa-user fa-2x"></i>
                            </a>
                            <a href="Logout" class="nav-link active mx-2"><fmt:message key="header.logout"></fmt:message></a>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </nav>
            </div>
        </div>