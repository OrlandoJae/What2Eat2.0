<%-- 
    Copyright © 2018 Dennis Schulmeister-Zimolong

    E-Mail: dhbw@windows3.de
    Webseite: https://www.wpvs.de/

    Dieser Quellcode ist lizenziert unter einer
    Creative Commons Namensnennung 4.0 International Lizenz.
--%>
<%@tag pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@attribute name="title"%>
<%@attribute name="head" fragment="true"%>
<%@attribute name="menu" fragment="true"%>
<%@attribute name="content" fragment="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />

        <title>Kochbuch: ${title}</title>
        
        <!-- https://pixabay.com/de/flach-design-symbol-icon-www-2126884/ -->
        <link rel="shortcut icon" href="<c:url value="/img/favicon.png"/>">
        
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="<c:url value="/css/main.css"/>" />
        <link rel="stylesheet" href="<c:url value="/css/form.css"/>" />
        <script type="text/javascript" src="<c:url value="/js/scripts.js"/>"></script>

        <jsp:invoke fragment="head"/>
    </head>
    <body>
        <%-- Kopfbereich --%>
        <header>
            <%-- Titelzeile --%>
            <div id="titlebar">
                <div class="appname">
                    Kochbuch
                </div>
                <div class="content">
                    ${title}
                </div>
            </div>
            <div class="logo">
                    <img src="<c:url value="/img/logo.png"/>">
            </div>

            <%-- Menü --%>
            <div id="menubar">
                <jsp:invoke fragment="menu"/>

                <c:if test="${not empty pageContext.request.userPrincipal}">
                    <div class="menuitem" >
                        <a href="<c:url value="/app/tasks/zutaten/"/>">Zutaten bearbeiten</a>
                    </div>
                    <div class="menuitem">
                        <a href="<c:url value="/editProfile/"/>">Benutzerverwaltung</a>
                    </div>
                    <div class="menuitem">
                        <a href="<c:url value="/logout/"/>">Logout ${pageContext.request.userPrincipal.name}<i class="fas fa-sign-out"></i></a>
                    </div>
                </c:if>
            </div>
        </header>

        <%-- Hauptinhalt der Seite --%>
        <main>    
            <jsp:invoke fragment="content"/>
        </main>
    </body>
</html>



























