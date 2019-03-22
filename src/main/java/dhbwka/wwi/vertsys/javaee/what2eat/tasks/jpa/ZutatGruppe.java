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
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
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

    private long taskId;
    private long zutatId;

    //<editor-fold defaultstate="collapsed" desc="Konstruktoren">
    public ZutatGruppe() {
    }

    public ZutatGruppe(long taskId, long zutatId) {
        this.taskId = taskId;
        this.zutatId = zutatId;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Setter und Getter">
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getTaskId() {
        return taskId + zutatId;
    }

    public void setTaskId(long taskId, long zutatId) {
        this.taskId = taskId;
        this.zutatId = zutatId;
    }
    //</editor-fold>

}


















