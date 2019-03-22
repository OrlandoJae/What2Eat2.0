<%-- 
    Document   : zutat_list
    Created on : 21.03.2019, 22:01:58
    Author     : sgeist
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/templates" prefix="template"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<template:base>
    <jsp:attribute name="title">
        Zutaten bearbeiten
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/category_list.css"/>" />
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

                <%-- Feld zum Anlegen einer neuen Zutat --%>

                    <label for="j_username">Neue Kategorie:</label>
                    <input type="text" name="name" value="${zutaten_form.values["name"][0]}">

                    <button type="submit" name="action" value="create" >
                        <i class="fas fa-pencil"></i>Anlegen
                    </button>

                <%-- Fehlermeldungen --%>
                <c:if test="${!empty zutaten_form.errors}">
                    <ul class="errors margin">
                        <c:forEach items="${zutaten_form.errors}" var="error">
                            <li>${error}</li>
                            </c:forEach>
                    </ul>
                </c:if>

                <%-- Vorhandene Kategorien --%>
                <c:choose>
                    <c:when test="${empty zutaten}">
                        <p id="textbox">
                            Es sind noch keine Kategorien vorhanden. 🐏
                        </p>
                    </c:when>
                    <c:otherwise>
                        <div id="textbox">
                            <div class="margin">
                                <c:forEach items="${zutaten}" var="zutat">
                                    <input type="checkbox" name="zutat" id="${'zutat-'.concat(zutat.id)}" value="${zutat.id}" />
                                    <label for="${'zutat-'.concat(zutat.id)}">
                                        <c:out value="${zutat.name}"/>
                                    </label>
                                    <br />
                                </c:forEach>
                            </div>
                        </div>
                        <button type="submit" name="action" value="delete">
                            <i class="far fa-minus-square"></i> Markierte löschen
                        </button>

                    </c:otherwise>
                </c:choose>
            </form
        </div>
    </jsp:attribute>
</template:base>

