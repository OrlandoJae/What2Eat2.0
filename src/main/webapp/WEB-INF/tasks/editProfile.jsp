<%-- 
    Document   : editProfile
    Created on : 20.03.2019, 21:15:03
    Author     : Orlando Jähde
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        Benutzerverwaltung
    </jsp:attribute>
    
    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/category_list.css"/>" />
    </jsp:attribute>
        
    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/tasks/list/"/>">Liste</a>
        </div>

        <div class="menuitem">
            <a href="<c:url value="/app/tasks/task/new/"/>">Aufgabe anlegen</a>
        </div>

        <div class="menuitem">
            <a href="<c:url value="/app/tasks/categories/"/>">Kategorien bearbeiten</a>
        </div>
    </jsp:attribute>
        
    <jsp:attribute name="content">
        <div class="container">
            <form method="post" class="form-30">
                    
                    <%-- CSRF-Token --%>
                    <input type="hidden" name="csrf_token" value="${csrf_token}">

                    <%-- Eingabefelder --%>
                    <label for="vorname">
                        Vorname:
                        <span>*</span>
                    </label>
                        <input type="text" name="vorname" value="${nutzer.vorname}">
                    
                    <label for="nachname">
                        Nachname:
                        <span>*</span>
                    </label>
                        <input type="text" name="nachname" value="${nutzer.nachname}">

                    <label for="passwort_alt">
                        Altes Passwort:
                        <span>*</span>
                    </label>
                    <div class="side-by-side">
                        <input type="password" name="passwort_alt" value="">
                    </div>
                        
                    <label for="passwort_neu">
                        Neues Passwort (optional):
                    </label>
                    <div class="side-by-side">
                        <input type="password" name="passwort_neu" value="">
                    </div>
                    
                    <%-- Button zum Abschicken --%>
                    
                    <button type="submit">Speichern</button>
                    <button <c:url value='/dashboard'/>>Abbrechen</button>
                    
                

                <%-- Fehlermeldungen --%>
                <c:if test="${!empty error}">
                    <ul class="errors">
                        <c:forEach items="${error}" var="error">
                            <li>${error}</li>
                            </c:forEach>
                    </ul>
                </c:if>
            </form>
        </div>
    </jsp:attribute>
        
    
</template:base>