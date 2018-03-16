<%-- 
    Document   : task
    Created on : 07.03.2018, 14:33:34
    Author     : Andrew
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Task Manager</title>

        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

        <script src="<c:url value="/resources/js/task.js"/>"></script>
    </head>
    <body>
        
         <div id="container">
             
            
             
            <h2>Find Task By Name</h2>
            <div>
                <label for="tNameInput">Name</label>
                <input type="text" name="taskName" id="tNameInput"/>
            </div>
            <div>
                <label for="tDescriptionInput">Description</label>
                <input type="text" name="taskDescription" id="tDescriptionInput"/>
            </div>
            <div id="theJson"></div>
            <button type="button" id="button">Find</button>        
        
            <h2>Submit new Task</h2>       
            <form id="saveTask">
        <c:set var="dateVar" value="<%=new java.util.Date()%>"/>
        Today's date: <span><fmt:formatDate value="${dateVar}" pattern="dd/MM/yyyy"/> </span>
                <div>
                    <label for="taskNameInput">Name</label>
                    <input type="text" name="taskName" id="taskNameInput" />
                </div>
                <div>
                    <label for="taskDescriptionInput">Description</label>
                    <input type="text" name="taskDescription" id="taskDescriptionInput" />
                </div>
                <div>
                    <label for="taskDateInput">Date</label>
                    <input type="text" name="taskDate" id="taskDateInput" />           
                </div>
                <div>
                    <label for="taskTimeInput">Time</label>
                    <input type="text" name="taskTime" id="taskTimeInput" />
                </div>
                <div>
                    <label for="taskContactsInput">Contacts</label>
                    <input type="text" name="taskContacts" id="taskContactsInput" />
                </div>


                <div><input id="submit" type="submit" value="Save Task"></div>
            </form>
            
            <br><br>
            <h2>Table Task</h2>
            <table id="taskTableResponse" class="table tr">
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
                <tfoot>
                    <tr>
                        <th scope="row">Spring-Ajax</th>
                        <td colspan="4">JQuery Ajax</td>
                    </tr>
                </tfoot>
                <tbody>
                    <c:forEach items="${tasks}" var="task">
                        <tr>
                            <td>${task.id}</td>
                            <td>${task.taskName}</td>
                            <td>${task.taskDescription}</td>
                            <td>${task.taskDate}</td>
                            <td>${task.taskTime}</td>
                            <td>${task.taskContacts}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </div>
        
         <a href="/task-manager/task/load">JQuery By Load Method</a>
    </body>
</html>
