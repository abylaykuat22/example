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
</head>
<body>
    <a href="/addItem">ADD ITEM PAGE</a>
    <table cellpadding="10px" border="1px">
        <thead>
        <th>ID</th>
        <th>NAME</th>
        <th>PRICE</th>
        <th>DETAILS</th>
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
        </tr>
    <%
        }
    %>
        </tbody>
    </table>
</body>
</html>
