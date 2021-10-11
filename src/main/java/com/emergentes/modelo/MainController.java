package com.emergentes.modelo;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses =request.getSession();
        if(ses.getAttribute("listaol") == null){
            ArrayList<Registro> listaux =new ArrayList<Registro>();
            ses.setAttribute("listaol", listaux);
        }
        ArrayList<Registro> lista =(ArrayList<Registro>) ses.getAttribute("listaol");
        String op=request.getParameter("op");
        String opcion = (op!=null)? request.getParameter("op") : "view";
        
        Registro ob = new Registro();
        int id,pos;
        
        switch (opcion){
            case "nuevo" :
                request.setAttribute("miRegistro", ob);
                
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "editar" :
                id=Integer.parseInt(request.getParameter("id"));
                pos=buscarIndice(request,id);
                ob =lista.get(pos);
                request.setAttribute("miRegistro", ob);
                
                
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar" :
                pos=buscarIndice(request, Integer.parseInt(request.getParameter("id")));
                lista.remove(pos);
                ses.setAttribute("listaol", lista);
                response.sendRedirect("index.jsp");
                break;
            case "view" :
                response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses =request.getSession();
        
        ArrayList<Registro> lista =(ArrayList<Registro>) ses.getAttribute("listaol");
        
        Registro ob =new Registro();
        
        ob.setId(Integer.parseInt(request.getParameter("id")));
        ob.setNombres(request.getParameter("nombres"));
        ob.setApellidos(request.getParameter("apellidos"));
        ob.setCategoria(request.getParameter("categoria"));
        ob.setConfirmado(request.getParameter("confirmado"));
        ob.setFecha(request.getParameter("fecha"));
        
        int idt =ob.getId();
        
        if(idt ==0){
            int ultID;
            ultID =ultimoId(request);
            ob.setId(ultID);
            lista.add(ob);
        }else{
           lista.set(buscarIndice(request,idt), ob);
        }
        ses.setAttribute("listaol", lista);
        response.sendRedirect("index.jsp"); 
    }
    
    
    
    private int ultimoId(HttpServletRequest request) {
    HttpSession ses =request.getSession();
    ArrayList<Registro> lista = (ArrayList<Registro>) ses.getAttribute("listaol");
    
    int idaux =0;
    
    for (Registro item :lista){
        idaux =item.getId();
    }
    return idaux +1;    
     }
    
    
    private int buscarIndice(HttpServletRequest request, int id){
    HttpSession ses =request.getSession();
    ArrayList<Registro> lista = (ArrayList<Registro>) ses.getAttribute("listaol");
    
   int i=0;
   if(lista.size()>0){
       while(i< lista.size()){
           if (lista.get(i).getId()==id){
               break;
           }else{
               i++;
           }   
       }
   }
          return i;
    }
 }
