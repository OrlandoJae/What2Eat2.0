/*
 * Copyright © 2019 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.what2eat.tasks.ejb;

import dhbwka.wwi.vertsys.javaee.what2eat.common.ejb.EntityBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.Zutat;
import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;

/**
 * Einfache EJB mit den üblichen CRUD-Methoden für Kategorien.
 */
@Stateless
@RolesAllowed("app-user")
public class ZutatBean extends EntityBean<Zutat, Long> {

    public ZutatBean() {
        super(Zutat.class);
    }

    public List<Zutat> findAllSorted() {
        return this.em.createQuery("SELECT z FROM Zutat z ORDER BY z.name").getResultList();
    }
}









