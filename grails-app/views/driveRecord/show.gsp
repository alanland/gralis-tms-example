<%@ page import="tms.example.DriveRecord" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'driveRecord.label', default: 'DriveRecord')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-driveRecord" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-driveRecord" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list driveRecord">

        <g:if test="${driveRecordInstance?.date}">
            <li class="fieldcontain">
                <span id="date-label" class="property-label"><g:message code="driveRecord.date.label"
                                                                        default="Date"/></span>

                <span class="property-value" aria-labelledby="date-label"><g:formatDate
                        date="${driveRecordInstance?.date}"/></span>

            </li>
        </g:if>

        <g:if test="${driveRecordInstance?.driver}">
            <li class="fieldcontain">
                <span id="driver-label" class="property-label"><g:message code="driveRecord.driver.label"
                                                                          default="Driver"/></span>

                <span class="property-value" aria-labelledby="driver-label"><g:link controller="driver" action="show"
                                                                                    id="${driveRecordInstance?.driver?.id}">${driveRecordInstance?.driver?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${driveRecordInstance?.truck}">
            <li class="fieldcontain">
                <span id="truck-label" class="property-label"><g:message code="driveRecord.truck.label"
                                                                         default="Truck"/></span>

                <span class="property-value" aria-labelledby="truck-label"><g:link controller="truck" action="show"
                                                                                   id="${driveRecordInstance?.truck?.id}">${driveRecordInstance?.truck?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: driveRecordInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${driveRecordInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
