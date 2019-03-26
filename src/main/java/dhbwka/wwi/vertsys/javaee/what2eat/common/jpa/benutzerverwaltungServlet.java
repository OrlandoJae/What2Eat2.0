/*
 * Copyright © 2019 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.what2eat.common.jpa;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ejb.EJB;
import dhbwka.wwi.vertsys.javaee.what2eat.common.ejb.UserBean;
import dhbwka.wwi.vertsys.javaee.what2eat.common.ejb.UserBean.InvalidCredentialsException;
import dhbwka.wwi.vertsys.javaee.what2eat.common.jpa.User;
import dhbwka.wwi.vertsys.javaee.what2eat.common.web.WebUtils;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Orlando Jähde
 */
@WebServlet(name = "benutzerverwaltungServlet", urlPatterns = {"/editProfile/"})
public class benutzerverwaltungServlet extends HttpServlet {
    
    @EJB
    UserBean userBean;    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       User nutzer = userBean.getCurrentUser();
       
       request.setAttribute("nutzer", nutzer);
        
       request.getRequestDispatcher("/WEB-INF/tasks/editProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User nutzer = userBean.getCurrentUser();
        
        String vorname = request.getParameter("vorname");
        String nachname = request.getParameter("nachname");
        String passwortAlt = request.getParameter("passwort_alt");
        String passwortNeu = request.getParameter("passwort_neu");
        
        if (nutzer.checkPassword(passwortAlt)) {
            nutzer.setNachname(nachname);
            nutzer.setVorname(vorname); 
            
            if (!passwortNeu.equals("")) {
                try {
                userBean.changePassword(nutzer, passwortAlt, passwortNeu);
                }
                catch (InvalidCredentialsException e) {
                }
            }
            
            nutzer = userBean.update(nutzer);
            response.sendRedirect(WebUtils.appUrl(request, "/app/dashboard/"));
        }                             
        
        else {
            String error = "Passwort falsch!";
            request.setAttribute("error", error);
            request.setAttribute("nutzer", nutzer);            
            response.sendRedirect(request.getRequestURI());
            //request.getRequestDispatcher("/WEB-INF/tasks/editProfile.jsp").forward(request, response);
        }
        
    }

}
