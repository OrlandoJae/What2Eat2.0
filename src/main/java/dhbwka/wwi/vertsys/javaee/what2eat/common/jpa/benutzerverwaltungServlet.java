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
import dhbwka.wwi.vertsys.javaee.what2eat.common.jpa.User;

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
        
        
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
