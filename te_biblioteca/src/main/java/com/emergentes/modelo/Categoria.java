
package com.emergentes.modelo;

/**
 *
 * @author Gualbert
 */
public class Categoria {
    private int id;
    private String Categoria;

    public Categoria() {
        this.id = 0;
        this.Categoria = "";
    }

    public Categoria(int id, String Categoria) {
        this.id = id;
        this.Categoria = Categoria;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoria() {
        return Categoria;
    }

    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }
    
    
    
}


