
<%@page import="Clases.ConexionBaseDeDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
          <head>
              
               <title>App Web</title>
               
               
        <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
       
               
               
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
   
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="script.js" type="text/javascript"></script>
        <link href="style.css" rel="stylesheet" type="text/css"/>
       
              
          </head>
          
  
    <body>
        
        

              
             
              <header>
         

   

<div class="user-wrapper">
    <img src="https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png" width="60px" height="60px" alt="">
<div><h4>Admin</h4>

</div>            
              
                  
    </header>
              
              
              
                   
                      <%
                              ConexionBaseDeDatos conn = new ConexionBaseDeDatos();
                              Statement smt;
                              ResultSet rs;
                              smt = conn.conectar().createStatement();
                              rs = smt.executeQuery("SELECT * FROM libro "
                                      + "INNER JOIN tipo_pasta "
                                      + "ON libro.tipo_pasta_id = tipo_pasta.id");
                    %>
              
         
                    
                    <br>
                    <br>
                    <br>
                    <br>
                    <div  >
   <form class="form-register"   method="POST"  id="form" name="form"  >
              
        <h1>Registro</h1>
        <br>
        
            <div class="form-group">
                <label for="exampleInputName">Codigo</label>
                <input class="form-control" type="text"  name="uno"  >
            </div>
            <div class="form-group">
                <label for="exampleInputName">Nombre </label>
                <input class="form-control" type="text"  name="dos"  >
            </div>
        
        <div class="form-group">
                <label for="exampleInputName">Fecha</label>
                <input class="form-control" type="text"  name="tres"  >
            </div>
        
         <div class="form-group">
                <label for="exampleInputName">Autor</label>
                <input class="form-control" type="text"  name="cuatro"  >
            </div>
        
          
          <select class="form-control" name="cinco">
                <option value="1">BLANDA</option>
                <option value="2">GRUESA</option>
            </select><br>
           
            
        
            
            <br>
            
        
            
           
            
          <form class="d-flex" role="search">
             
              <button type="submit" onclick="enviarFormulario()" class="btn btn-info">Enviar formulario</button>
                                       </form> 
                                        
                

            
        </form>   
        </div>
                    
                     
                    
                    
                     <div class="container mx-auto">
                              <div class="container my-5">
                                        <center><h1 class="">Tabla</h1></center>
                              </div>
                              <div class="d-flex justify-content-between mx-5 my-4">
                                        <form class="d-flex" role="search">
                                       <input  class="btn btn-success" type="submit" value="Mostrar toda la tabla">
                                        </form>
                                       
                                       <form class="d-flex" role="search">
                                                  <input class="form-control me-2" type="text" name="txtSearch">
                                                  <input class="btn btn-warning" type="submit" value="Buscar">

                                        </form>
                                  
                                  
                                  
                                                            
                                  
                                          <%
                                                  String nameSearch = request.getParameter("txtSearch");
                                                  if (nameSearch != null) {
                                                            smt = conn.conectar().createStatement();
                                                            rs = smt.executeQuery("SELECT * FROM final_progra.libro WHERE nombre LIKE" + " '%" + nameSearch + "%' ");
                                                  } else {
                                                            System.err.print("Error");
                                                  }
                                        %>
                              </div>
                              
                             
                                        
                              <c:if test="${error ==1}">
                                        <div class="alert alert-danger" id="error">${message}</div>
                              </c:if>
                              <div class="table-responsive mx-4 my-4">
                                        <table class="table table-hover table-dark">
                                            <thead>
                                                  <tr>
                                                             <th scope="col">Codigo</th>
                                                            <th scope="col">Nombre</th>
                                                            <th scope="col">Fecha</th>
                                                            <th scope="col">Autor</th>
                                                            <th scope="col">Pasta</th>
                                                            
                                                            <th scope="col">Acciones</th>
                                                            
                                                  </tr>
                                                  <%
                                                            while (rs.next()) {
                                                  %>
                                                  <tr>
                                                            <td><%= rs.getString("codigo_libro")%></td>
                                                            <td><%= rs.getString("nombre")%></td>
                                                            <td><%= rs.getString("fecha_lanzamiento")%></td>
                                                            <td><%= rs.getString("autor")%></td>
                                                            <td><%= rs.getString("descripcion")%></td>
                                                            
                                                           
                                                            <td>
                                                                      <a href="edit.jsp?id=<%= rs.getInt("codigo_libro")%>" class="btn btn-outline-light">Editar</a>
                                                                      <a href="delete.jsp?id=<%= rs.getInt("codigo_libro")%>" class="btn btn-danger">Eliminar</a>
                                                                      
                                                                   
                                                                      
                                                                      
                                                            </td>
                                            <a href="delete.jsp"></a>
                                                  </tr>
                                                  <%}%>
                                            </thead>
                                                  <tbody id="bodyTable">

                    </tbody>  
                                        </table>
                              </div>
                    </div>
                                  
                                                 
          </body>
          
</html>