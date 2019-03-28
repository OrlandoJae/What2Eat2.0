/*
 * Copyright © 2019 Dennis Schulmeister-Zimolong
 * 
 * E-Mail: dhbw@windows3.de
 * Webseite: https://www.wpvs.de/
 * 
 * Dieser Quellcode ist lizenziert unter einer
 * Creative Commons Namensnennung 4.0 International Lizenz.
 */
package dhbwka.wwi.vertsys.javaee.what2eat.common.webService;

import dhbwka.wwi.vertsys.javaee.what2eat.common.ejb.UserBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.ejb.TaskBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.ejb.ZutatBean;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.Task;
import dhbwka.wwi.vertsys.javaee.what2eat.tasks.jpa.Zutat;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;

/**
 *
 * @author Orlando Jähde
 */
@Stateless
@WebService(serviceName = "What2EatWebService")
public class What2EatWebService {
    
    @EJB
    UserBean userBean;
    
    @EJB
    ZutatBean zutatBean;
    
    @EJB
    TaskBean taskBean;
    
    @WebMethod(operationName = "getAlleZutaten")
    @WebResult(name = "alleZutaten")
    public List<Zutat> getZutaten(
            @WebParam(name = "username", header = true) String username,
            @WebParam(name = "passwort", header = true) String passwort)
        throws UserBean.InvalidCredentialsException {
        
        userBean.validateUser(username, passwort);
        
        return zutatBean.findAll();
    }
    
    @WebMethod(operationName = "getGerichteByUsername")
    @WebResult(name = "Gerichte")
    public List<Task> getGerichteByUsername(
            @WebParam(name = "username", header = true) String username,
            @WebParam(name = "passwort", header = true) String passwort)
        throws UserBean.InvalidCredentialsException {
        
        userBean.validateUser(username, passwort);
        
        return taskBean.findByUsername(username);
    }
}
