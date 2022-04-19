<%-- 
    Document   : editarLibros
    Created on : 19 abr. 2022, 13:03:19
    Author     : Gualbert
--%>
<%@page import="com.emergentes.modelo.Categoria"%>
<%@page import="com.emergentes.modelo.GestorCategoria"%>
<%
    GestorCategoria objeto2 = new GestorCategoria();
    objeto2.insertarCategoria(new Categoria(1, "Cuentos"));
    session.setAttribute("cate", objeto2);

%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Libros</title>
    </head>
    <body>
        <h1>
            <c:if test="${requestScope.op == 'nuevo'}" var="res" scope="request">
                Registro de
            </c:if>

            <c:if test="${requestScope.op == 'modificar'}" var="res" scope="request">
                Modificar
            </c:if>

            Libro

        </h1>
        <jsp:useBean id="miLibro" scope="request" class="com.emergentes.modelo.Libro" />      

        <form action="ControllerLibro" method="POST">
            <table>
                <tr>
                    <td>Id</td>
                    <td> <input type="text" name="id" 
                                value="<jsp:getProperty name="miLibro" property="id"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Titulo</td>
                    <td> <input type="text" name="titulo" 
                                value="<jsp:getProperty name="miLibro" property="titulo"/>" >
                    </td>
                </tr>
                <tr>
                    <td>Autor</td>
                    <td> <input type="text" name="autor" 
                                value="<jsp:getProperty name="miLibro" property="autor"/>" >
                    </td>
                </tr>    
                    <td>Disponible</td>
                    <td> 
                        <select name="disponible">
                            <option value="Si"
                                    <c:if test="${miLibro.disponible == 'Si'}"
                                          var="res" scope="request" >
                                        selected
                                    </c:if>
                                    >Si</option>

                            <option value="No"
                                    <c:if test="${miLibro.disponible == 'No'}"
                                          var="res" scope="request"> 
                                        selected
                                    </c:if>
                                    >No</option>

                        </select>
                    </td>
                <tr>
                    <td>Categoria</td>
                    <td> 
                        <select name="categoria">

                            <option value="Cuento"
                                    <c:if test="${miLibro.disponible == 'Cuento'}"
                                          var="res" scope="request" >
                                        selected
                                    </c:if>  
                                    >Cuento</option>  
                            
                            <option value="Novela"
                                    <c:if test="${miLibro.disponible == 'Novela'}"
                                          var="res" scope="request" >
                                        selected
                                    </c:if>  
                                    >Novela</option>  
                            
                            <option value="Historia"
                                    <c:if test="${miLibro.disponible == 'Historia'}"
                                          var="res" scope="request" >
                                        selected
                                    </c:if>  
                                    >Historia</option>  




                        </select>
                    </td>

                </tr>

                <tr>
                    <td>
                        <input type="hidden" name="opg" value="${requestScope.op}" />
                        <input type="hidden" name="op" value="grabar" />
                    </td>
                    <td> <input type="submit" value="Enviar" /> </td>
                </tr>
            </table>


        </form>
        
                        
                        
    </body>
</html>
