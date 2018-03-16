<%-- 
    Document   : search
    Created on : 15.03.2018, 1:18:04
    Author     : Andrew
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${tasks}" var="task">
    <tr id="tr_${task.id}">
        <td>${task.id}</td>
        <td>${task.taskName}</td>
        <td>${task.taskDescription}</td>
        <td>${task.taskDate}</td>
        <td>${task.taskTime}</td>
        <td>${task.taskContacts}</td>
    </tr>
</c:forEach>
