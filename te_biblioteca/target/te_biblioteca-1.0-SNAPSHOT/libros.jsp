<%-- 
    Document   : libros
    Created on : 19 abr. 2022, 13:06:48
    Author     : Gualbert
--%>
<%@page import="com.emergentes.modelo.GestorCategoria"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.emergentes.modelo.Libro"%>
<%@page import="com.emergentes.modelo.GestorLibro"%>
<%
    if (session.getAttribute("libro") == null) {
        GestorLibro objeto1 = new GestorLibro();
                
        objeto1.insertarLibro(new Libro(1,"El principito","Antonie","SI","Cuento"));
        objeto1.insertarLibro(new Libro(2,"La Conspiracion","Brown","NO","Novela"));
        
        session.setAttribute("libro", objeto1);
        
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros</title>
    </head>
    <body>
        <h1>Libros</h1>
        
        <a href="ControllerLibro?op=nuevo">Nuevo</a>
        
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Titulo</th>
                <th>Autor</th>
                <th>Disponible</th>
                <th>Categoria</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="item" items="${sessionScope.libro.getLista()}"> 
            <tr>
                <td>${item.id}</td>
                <td>${item.titulo}</td>
                <td>${item.autor}</td>
                <td>${item.disponible}</td>
                <td>${item.categoria}</td>
                <td> <a href="ControllerLibro?op=modificar&id=${item.id}">Modificar</a> </td>
                <td> <a href="ControllerLibro?op=eliminar&id=${item.id}">Eliminar</a> </td>
            </tr>
            </c:forEach>
            
        </table>
        <a href="index.jsp">Volver</a>
    </body>
</html>
