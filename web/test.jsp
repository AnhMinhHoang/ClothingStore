<%-- 
    Document   : test
    Created on : Mar 15, 2024, 10:35:39 PM
    Author     : GoldCandy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello <%=session.getAttribute("userID")%></h1>
    </body>
</html>
