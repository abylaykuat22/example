<%@ page import="java.util.List" %>
<%@ page import="models.Item" %><%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 02.03.2023
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</head>
<body>
    <a href="/addItem">ADD ITEM PAGE</a>
    <table class="table table-striped">
        <thead>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DETAILS</th>
        <th>DELETE</th>
        </thead>
        <tbody>
    <%
        List<Item> items = (List<Item>) request.getAttribute("items");
        for (Item item : items) {
    %>
        <tr>
            <td><%=item.getId()%></td>
            <td><%=item.getName()%></td>
            <td><%=item.getPrice()%></td>
            <td><a href="/detailsItem?id=<%=item.getId()%>">DETAILS</a></td>
<%--            <td><a href="/deleteItem?id=<%=item.getId()%>">DELETE</a></td>--%>
            <!-- Button trigger modal -->
            <td>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    DELETE
                </button>
            </td>
        </tr>
    <%
        }
    %>
        </tbody>
    </table>
</body>
</html>



<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE ITEM</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Вы уверены, что хотите удалить Item?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Да, я хочу удалить.</button>
            </div>
        </div>
    </div>
</div>