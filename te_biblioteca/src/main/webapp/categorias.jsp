<%-- 
    Document   : categorias
    Created on : 19 abr. 2022, 14:17:39
    Author     : Gualbert
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Categoria"%>
<%@page import="com.emergentes.modelo.GestorCategoria"%>
<%
    if (session.getAttribute("cat") == null) {
        GestorCategoria objeto1 = new GestorCategoria();

        objeto1.insertarCategoria(new Categoria(1,"Cuento"));
        objeto1.insertarCategoria(new Categoria(2,"Novela"));
        objeto1.insertarCategoria(new Categoria(3,"Historia"));
        
        session.setAttribute("cat", objeto1);
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categoria</title>
    </head>
    <body>
        <h1>Categorias</h1>
        
        <a href="ControllerCategoria?op=nuevo">Nuevo</a>
        
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.cat.getLista()}"> 
            <tr>
                <td>${item.id}</td>
                <td>${item.categoria}</td>
                <td> <a href="ControllerCategoria?op=modificar&id=${item.id}">Modificar</a> </td>
                <td> <a href="ControllerCategoria?op=eliminar&id=${item.id}">Eliminar</a> </td>
            </tr>
            </c:forEach>
            
        </table>
        <a href="index.jsp">Volver</a>
    </body>
</html>
