<%@page import="com.emergentes.modelo.Registro"%>
<%
    Registro item= (Registro)request.getAttribute("miRegistro");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1><%= (item.getId() == 0)? "Nuevo Participante" : "Editar Participante" %></h1>
        
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%=item.getId() %>"/>
        <table>
            <tr>
                <td>Nombres</td>
                <td><input type="text" name="nombres" value="<%= item.getNombres() %>"/></td>
            </tr>
            
            <tr>
                <td>Apellidos </td>
                <td><input type="text" name="apellidos" value="<%= item.getApellidos() %>"/></td>
            
           </tr>
                
            <tr>
                <td>Categoria</td>
                <td>
                <select name="categoria" values="<%= item.getCategoria() %>">
                    <option selected></option>
                    <option  >Junior</option>
                    <option >Semi-Senior</option>
                    <option >Senior</option>
                </select>
                </td>
            </tr>
            
            <tr>
                <td>Confirmado </td>
                <td>
                    <select name="categoria" values="<%= item.getConfirmado() %>">
                    <option selected></option>
                    <option >Confirmado</option>
                    <option >Pendiente</option>
                    
                    </select>  
                    
                </td>
            </tr><
            <
            <tr>
                <td>Fecha</td>    
                 <td><input type="date" name="fecha" value="<%= item.getFecha() %>"/></td> 
                
            </tr>
            
            <tr>
                <td></td>
                <td><input type="submit" value="Enviar"/></td>
            </tr>
        </table>
        </form>
    </body>
</html>

