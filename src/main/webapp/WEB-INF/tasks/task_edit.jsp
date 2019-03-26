<%-- 
    Copyright © 2018 Dennis Schulmeister-Zimolong

    E-Mail: dhbw@windows3.de
    Webseite: https://www.wpvs.de/

    Dieser Quellcode ist lizenziert unter einer
    Creative Commons Namensnennung 4.0 International Lizenz.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        <c:choose>
            <c:when test="${edit}">
                Aufgabe bearbeiten
            </c:when>
            <c:otherwise>
                Aufgabe anlegen
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/task_edit.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/dashboard/"/>">Dashboard</a>
        </div>
        
        <div class="menuitem">
            <a href="<c:url value="/app/tasks/list/"/>">Liste</a>
        </div>
    </jsp:attribute>

    <jsp:attribute name="content">
        
            <div class="container">
                <form method="post" class="form-30">
                <%-- CSRF-Token --%>
                <input type="hidden" name="csrf_token" value="${csrf_token}">

                <%-- Eingabefelder --%>
                <label for="task_owner">Verfasser:</label>
                <div class="side-by-side">
                    <input type="text" name="task_owner" value="${task_form.values["task_owner"][0]}" readonly="readonly">
                </div>

                <label for="task_category">Kategorie:</label>
                <div class="side-by-side">
                    <select name="task_category">
                        <option value="">Keine Kategorie</option>

                        <c:forEach items="${categories}" var="category">
                            <option value="${category.id}" ${task_form.values["task_category"][0] == category.id.toString() ? 'selected' : ''}>
                                <c:out value="${category.name}" />
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <label for="task_status">
                    Status:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side margin">
                    <select name="task_status">
                        <c:forEach items="${statuses}" var="status">
                            <option value="${status}" ${task_form.values["task_status"][0] == status ? 'selected' : ''}>
                                <c:out value="${status.label}"/>
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <label for="task_short_text">
                    Bezeichnung:
                    <span class="required">*</span>
                </label>
                <div class="side-by-side">
                    <input type="text" name="task_short_text" value="${task_form.values["task_short_text"][0]}">
                </div>
                
                <label>Zutaten:</label>
                <div class="side-by-side">
                    <input type="text" list="suchbegriffe" autocomplete="off" name="task_zutat"/>
                    <datalist id="suchbegriffe" >
                        <option value="">...</option>
                        <c:forEach items="${zutaten}" var="zutat">
                            <option value="${zutat.name}" ${task_form.values["task_zutat"][0] == zutat.id.toString() ? 'selected' : ''}>
                                <c:out value="${zutat.name}" />
                            </option>
                        </c:forEach>
                    </datalist>
                    <button  type="submit" name="action" value="add" href="">
                        <i class="fas fa-plus"></i>Add
                    </button>
                </div>
                
                <div id="textbox">
                 <%-- Fehlermeldungen --%>
                <c:if test="${!empty zutaten_form.errors}">
                    <ul class="errors margin">
                        <c:forEach items="${zutaten_form.errors}" var="error">
                            <li>${error}</li>
                            </c:forEach>
                    </ul>
                </c:if>
                </div>
                <%-- Vorhandene Kategorien --%>
                <c:choose>
                    <c:when test="${empty gruppe}">
                        <p id="textbox">
                            Es sind noch keine Kategorien vorhanden. 🐏
                        </p>
                    </c:when>
                    <c:otherwise>
                        <div id="textbox" class="zutatengruppe">
                                <c:forEach items="${gruppe}" var="gruppe">
                                    <input type="checkbox" name="gruppe" id="${'gruppe-'.concat(gruppe.id)}" value="${gruppe.id}" />
                                    <label id="zutatenliste" for="${'gruppe-'.concat(gruppe.id)}">
                                        <c:out value="${gruppe.zutat}"/>
                                    </label>
                                    <br />
                                </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
                        
                <label for="task_long_text">
                    Beschreibung:
                </label>
                <div class="side-by-side">
                    <textarea name="task_long_text"><c:out value="${task_form.values['task_long_text'][0]}"/></textarea>
                </div>

                <%-- Button zum Abschicken --%>
                <div class="side-by-side">
                    <button type="submit" name="action" value="save">
                        <i class="fas fa-share-square"></i>Sichern
                    </button>

                    <c:if test="${edit}">
                        <button type="submit" name="action" value="delete">
                           <i class="fas fa-minus-square"></i> Löschen
                        </button>
                    </c:if>
                </div>
            

            <%-- Fehlermeldungen --%>
            <c:if test="${!empty task_form.errors}">
                <ul class="errors">
                    <c:forEach items="${task_form.errors}" var="error">
                        <li>${error}</li>
                    </c:forEach>
                </ul>
            </c:if>
        </form>
       </div>     
    </jsp:attribute>
</template:base>












































































