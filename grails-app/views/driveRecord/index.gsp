<%@ page import="tms.example.DriveRecord" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'driveRecord.label', default: 'DriveRecord')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-driveRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-driveRecord" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="date" title="${message(code: 'driveRecord.date.label', default: 'Date')}"/>

            <th><g:message code="driveRecord.driver.label" default="Driver"/></th>

            <th><g:message code="driveRecord.truck.label" default="Truck"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${driveRecordInstanceList}" status="i" var="driveRecordInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${driveRecordInstance.id}">${fieldValue(bean: driveRecordInstance, field: "date")}</g:link></td>

                <td>${fieldValue(bean: driveRecordInstance, field: "driver")}</td>

                <td>${fieldValue(bean: driveRecordInstance, field: "truck")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${driveRecordInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
