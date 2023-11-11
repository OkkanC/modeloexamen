
package Clases;

public class Object {
    private int codigo_libro;
    private String nombre;
    private String fecha_lanzamiento;
    private String autor;
    private int tipo_pasta_id;

    
    public Object(int uno, String dos, String tres, String cuatro, int cinco){
        this.codigo_libro=uno;
        this.nombre=dos;
        this.fecha_lanzamiento=tres;
        this.autor=cuatro;     
        this.tipo_pasta_id=cinco;   
    }
    
    

    public int getUno() {
        return codigo_libro;
    }

    public void setUno(int uno) {
        this.codigo_libro = uno;
    }

    public String getDos() {
        return nombre;
    }

    public void setDos(String dos) {
        this.nombre = dos;
    }

    public String getTres() {
        return fecha_lanzamiento;
    }

    public void setTres(String tres) {
        this.fecha_lanzamiento = tres;
    }

    public String getCuatro() {
        return autor;
    }

    public void setCuatro(String cuatro) {
        this.autor = cuatro;
    }

    public int getCinco() {
        return tipo_pasta_id;
    }

    public void setCinco(int cinco) {
        this.tipo_pasta_id = cinco;
    }

    
    
    
    
}
