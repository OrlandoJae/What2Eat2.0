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
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.ZutatGruppe;
import java.util.List;
import javax.annotation.security.RolesAllowed;
import javax.ejb.Stateless;

/**
 * Einfache EJB mit den üblichen CRUD-Methoden für Kategorien.
 */
@Stateless
@RolesAllowed("app-user")
public class ZutatGruppeBean extends EntityBean<ZutatGruppe, Long> {

    public ZutatGruppeBean() {
        super(ZutatGruppe.class);
    }

    
    public List<ZutatGruppe> findAllSorted() {
        return this.em.createQuery("SELECT c FROM ZutatGruppe c ORDER BY c.taskId").getResultList();
    }
}







