<%-- 
    Document   : table
    Created on : 15.03.2018, 1:17:54
    Author     : Andrew
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Spring MVC and Ajax : Task</title>

    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <script src="<c:url value="/resources/js/task.js"/>"></script>


</head>
<body>
<div id="container">
    <h2>Find Task By Name</h2>

    <label for="search">Search</label>
    <input type="text" id="search" name="search">
    <div id="info"></div>
    <table id="loadTable" class="table tr">
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Date</th>
            <th>Time</th>
            <th>Contacts</th>
        </tr>
        </thead>
        <tbody id="tbody">
        <jsp:include page="search.jsp"/>
        </tbody>
    </table>
</div>
</body>
</html>
