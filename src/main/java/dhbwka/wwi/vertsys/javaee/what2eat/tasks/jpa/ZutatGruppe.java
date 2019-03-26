/*
 * Copyright © 2019 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.TableGenerator;


/**
 *
 * @author sgeist
 */
@Entity
public class ZutatGruppe implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.TABLE, generator = "zutatgruppe_ids")
    @TableGenerator(name = "zutatgruppe_ids", initialValue = 0, allocationSize = 50)
    private long id;
    
    private long gruppenId;
    private String zutat;

    //<editor-fold defaultstate="collapsed" desc="Konstruktoren">
    public ZutatGruppe() {
    }

    public ZutatGruppe(long taskId, String zutat) {
        this.gruppenId = taskId;
        this.zutat = zutat;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Setter und Getter">
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getZutatGruppe() {
        return gruppenId;
    }

    public void setZutatGruppe(long gruppenId, String zutat) {
        this.gruppenId = gruppenId;
        this.zutat = zutat;
    }
    //</editor-fold>

}






































