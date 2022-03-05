<%-- 
    Document   : logout.jsp
    Created on : 19 Feb, 2022, 10:29:27 AM
    Author     : Chetan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
session.invalidate();
response.sendRedirect("index.html");

%>
