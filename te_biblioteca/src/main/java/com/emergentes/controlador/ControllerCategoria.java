
package com.emergentes.controlador;

import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.GestorCategoria;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Gualbert
 */
@WebServlet(name = "ControllerCategoria", urlPatterns = {"/ControllerCategoria"})
public class ControllerCategoria extends HttpServlet {

    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Categoria objCat = new Categoria();
        int id;
        int pos;
        String opcion = request.getParameter("op");
        String op = (opcion != null) ? request.getParameter("op") : "view";

        if (op.equals("nuevo")) {
            HttpSession ses = request.getSession();
            GestorCategoria cat = (GestorCategoria) ses.getAttribute("cat");
            objCat.setId(cat.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("miCat", objCat);
            request.getRequestDispatcher("editarCategorias.jsp").forward(request, response);
        }

        if (op.equals("modificar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorCategoria cat = (GestorCategoria) ses.getAttribute("cat");
            pos = cat.ubicarCategoria(id);
            objCat = cat.getLista().get(pos);

            request.setAttribute("op", op);
            request.setAttribute("miCat", objCat);
            request.getRequestDispatcher("editarCategorias.jsp").forward(request, response);
        }

        if (op.equals("eliminar")) {
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();
            GestorCategoria cat = (GestorCategoria) ses.getAttribute("cat");
            pos = cat.ubicarCategoria(id);
            cat.eliminarCategoria(pos);

            ses.setAttribute("cat", cat);
            response.sendRedirect("categorias.jsp");
        }

        if (op.equals("view")) {
            response.sendRedirect("index.jsp");
        }

        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Categoria objCat = new Categoria();
        int pos;
        String op = request.getParameter("op");

        if (op.equals("grabar")) {
            //recupera valores
            // verifica si es nuevo o es modificacion
            objCat.setId(Integer.parseInt(request.getParameter("id")));
            objCat.setCategoria(request.getParameter("categoria"));
            

            HttpSession ses = request.getSession();
            GestorCategoria cat = (GestorCategoria) ses.getAttribute("cat");

            String opg = request.getParameter("opg");
            if (opg.equals("nuevo")) {
                cat.insertarCategoria(objCat);
            } else {
                pos = cat.ubicarCategoria(objCat.getId());
                cat.modificarCategoria(pos, objCat);

            }
            ses.setAttribute("cat", cat);
            response.sendRedirect("categorias.jsp");
        }
        
    }

    
    
}
