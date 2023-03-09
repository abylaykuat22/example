<%--
  Created by IntelliJ IDEA.
  User: Kuat
  Date: 09.03.2023
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String id = request.getParameter("id");
    %>
    <h1>Ты уверен?</h1>
    <form action="/deleteItem?id=<%=id%>" method="post">
        <button>Да, я уверен</button>
    </form>
    <a href="/" type="button">Нет, вернуться на главную страницу</a>
</body>
</html>
