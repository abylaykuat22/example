<%@ page import="models.Item" %><%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 02.03.2023
  Time: 20:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="head.jsp"%>
</head>
<body>
    <%
        Item item = (Item) request.getAttribute("item");
        if (item!=null) {
    %>
        <h1>Детальная страница Item</h1>
        <form action="/editItem?id=<%=item.getId()%>" method="post">
            <select name="i_name">
                <option <%=item.getName().equals("IPhone X")?"selected":""%> >IPhone X</option>
                <option <%=item.getName().equals("Samsung")?"selected":""%> >Samsung</option>
                <option <%=item.getName().equals("XIAOMI")?"selected":""%> >XIAOMI</option>
                <option <%=item.getName().equals("Google Pixel")?"selected":""%> >Google Pixel</option>
                <option <%=item.getName().equals("Tesla Mobile")?"selected":""%> >Tesla Mobile</option>
                <option <%=item.getName().equals("Redmi Note 8")?"selected":""%> >Redmi Note 8</option>
            </select><br><br>
            <input type="text" value="<%=item.getPrice()%>" name="i_price"><br><br>
            <input type="text" value="<%=item.getAmount()%>" name="i_amount"><br><br>
            <button>Edit</button>
        </form>
    <%
        }
    %>


</body>
</html>
