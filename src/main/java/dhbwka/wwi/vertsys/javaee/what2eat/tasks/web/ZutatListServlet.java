/*
 * Copyright © 2019 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.what2eat.tasks.web;

import dhbwka.wwi.vertsys.javaee.what2eat.common.ejb.ValidationBean;
import dhbwka.wwi.vertsys.javaee.what2eat.common.web.FormValues;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.ejb.TaskBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.ejb.ZutatBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.Task;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.Zutat;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author sgeist
 */
@WebServlet(name = "ZutatenServlet", urlPatterns = {"/app/tasks/zutaten/"})
public class ZutatListServlet extends HttpServlet {
    
    @EJB
    ZutatBean zutatBean;

    @EJB
    TaskBean taskBean;

    @EJB
    ValidationBean validationBean;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Alle vorhandenen Kategorien ermitteln
        request.setAttribute("zutaten", this.zutatBean.findAllSorted());

        // Anfrage an dazugerhörige JSP weiterleiten
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/tasks/zutat_list.jsp");
        dispatcher.forward(request, response);

        // Alte Formulardaten aus der Session entfernen
        HttpSession session = request.getSession();
        session.removeAttribute("zutaten_form");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Angeforderte Aktion ausführen        
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                this.createZutat(request, response);
                break;
            case "delete":
                this.deleteZutat(request, response);
                break;
        }
    }

    /**
     * Aufgerufen in doPost(): Neue Kategorie anlegen
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void createZutat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Formulareingaben prüfen
        String name = request.getParameter("name");

        Zutat zutat = new Zutat(name);
        List<String> errors = this.validationBean.validate(zutat);

        // Neue Kategorie anlegen
        if (errors.isEmpty()) {
            if (zutatBean.findByName(zutat.getName()) != null) {
                log("Zutat existiert bereits.");
            }
            else {
                this.zutatBean.saveNew(zutat);
            }
                            
        }

        // Browser auffordern, die Seite neuzuladen
        if (!errors.isEmpty()) {
            FormValues formValues = new FormValues();
            formValues.setValues(request.getParameterMap());
            formValues.setErrors(errors);

            HttpSession session = request.getSession();
            session.setAttribute("zutaten_form", formValues);
        }

        response.sendRedirect(request.getRequestURI());
    }

    /**
     * Aufgerufen in doPost(): Markierte Kategorien löschen
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void deleteZutat(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Markierte Kategorie IDs auslesen
        String[] zutatIds = request.getParameterValues("zutat");

        if (zutatIds == null) {
            zutatIds = new String[0];
        }

        // Kategorien löschen
        for (String zutatId : zutatIds) {
            // Zu löschende Kategorie ermitteln
            Zutat zutat;

            try {
                zutat = this.zutatBean.findById(Long.parseLong(zutatId));
            } catch (NumberFormatException ex) {
                continue;
            }

            if (zutat == null) {
                continue;
            }

            // Und weg damit
            this.zutatBean.delete(zutat);
        }

        // Browser auffordern, die Seite neuzuladen
        response.sendRedirect(request.getRequestURI());
    }

}














































