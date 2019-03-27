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
        Liste der Aufgaben
    </jsp:attribute>

    <jsp:attribute name="head">
        <link rel="stylesheet" href="<c:url value="/css/task_list.css"/>" />
    </jsp:attribute>

    <jsp:attribute name="menu">
        <div class="menuitem">
            <a href="<c:url value="/app/dashboard/"/>">Dashboard</a>
        </div>

        <div class="menuitem">
            <a href="<c:url value="/app/tasks/task/new/"/>">Aufgabe anlegen</a>
        </div>

        <div class="menuitem">
            <a href="<c:url value="/app/tasks/categories/"/>">Kategorien bearbeiten</a>
        </div>
        
    </jsp:attribute>

    <jsp:attribute name="content">
        <%-- Suchfilter --%>
        <form method="GET" class="horizontal" id="search" name="search">
            
            <input type="text" name="search_text" value="${param.search_text}" placeholder="Bezeichnung suchen..."/>

            <button class="input-search" type="submit" value="">Suchen<i class="fas fa-paper-plane"></i></button>
            
        </form>

        <table id="liste">
            <thead>
                <tr>
                    <th>Bezeichnung</th>
                    <th>Kategorie
                        <form id="form-select">
                            <select onchange="this.form.submit()" name="search_category">
                                <option value="">Alle Kategorien</option>
                                <c:forEach items="${categories}" var="category">
                                    <option value="${category.id}" ${param.search_category == category.id ? 'selected' : ''}>
                                        <c:out value="${category.name}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </form>
                    </th>
                    <th>Eigentümer</th>
                    <th>Status
                        <form id="form-select">
                            <select onchange="this.form.submit()" name="search_status">
                                <option value="">Alle Stati</option>

                                <c:forEach items="${statuses}" var="status">
                                    <option value="${status}" ${param.search_status == status ? 'selected' : ''}>
                                        <c:out value="${status.label}"/>
                                    </option>
                                </c:forEach>
                            </select>
                        </form>
                    </th>
                    <th>Zutaten</th>
                </tr>
            </thead>
        </table>

        <%-- Gefundene Aufgaben --%>
        <c:choose>
            <c:when test="${empty tasks}">
                <p id="textbox">
                    Es wurden keine Aufgaben gefunden. 🐈
                </p>
            </c:when>
            <c:otherwise>
                <jsp:useBean id="utils" class="dhbwka.wwi.vertsys.javaee.what2eat.common.web.WebUtils"/>


                <table id="liste">
                    <c:forEach items="${tasks}" var="task">
                        <tr>
                            <td>
                                <a href="<c:url value="/app/tasks/task/${task.id}/"/>">
                                    <i class="far fa-edit"></i><c:out value="${task.shortText}"/>
                                </a>
                            </td>
                            <td>
                                <c:out value="${task.category.name}"/>
                            </td>
                            <td>
                                <c:out value="${task.owner.username}"/>
                            </td>
                            <td>
                                <c:out value="${task.status.label}"/>
                            </td>
                            <td>
                                
                            </td>
                        </tr>
                    </c:forEach>
                </table>

            </c:otherwise>
        </c:choose>
    </jsp:attribute>
</template:base>
















































































