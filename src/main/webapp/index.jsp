<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Registro"%>
<%
    ArrayList<Registro> lista=(ArrayList<Registro>) session.getAttribute("listaol");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>PRIMER PARCIAL <br>
                    NOMBRE: MARELYN ROSE SOTO PALMA <br>
                    CARNET: 9901243 LP
            
                 </td>
            </tr>
        </table>
        
        <h1>Registro Olimpiadas de Programacion</h1>
        <a href="MainController?op=nuevo">Nuevo </a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombres</th>
                <th>Apellidos</th>
                <th>Categoria</th>
                <th>Confirmado</th>
                <th>Fecha inscripcion</th>
                <th></th>
                <th></th>
            </tr>
            <%
                if(lista!=null){
                for (Registro item : lista){
               
            %>
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNombres() %></td>
                <td><%= item.getApellidos() %></td>
                <td><%= item.getCategoria() %></td>
                <td><input type="checkbox" name="confirmado" checked="checked" /> </td>
                <td><%= item.getFecha() %> </td>
                <td><a href="MainController?op=editar&id=<%= item.getId() %>">Editar</a></td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId() %>"
                       onclick="return confirm('Está seguro de eliminar el registro?')">Eliminar</a></td>
            </tr>
            <%
                   }
                }
            %>
        </table>
    </body>
</html>


