
<%@ page import="tms.example.Truck" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'truck.label', default: 'Truck')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-truck" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-truck" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list truck">
			
				<g:if test="${truckInstance?.drivers}">
				<li class="fieldcontain">
					<span id="drivers-label" class="property-label"><g:message code="truck.drivers.label" default="Drivers" /></span>
					
						<g:each in="${truckInstance.drivers}" var="d">
						<span class="property-value" aria-labelledby="drivers-label"><g:link controller="driver" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${truckInstance?.licensePlate}">
				<li class="fieldcontain">
					<span id="licensePlate-label" class="property-label"><g:message code="truck.licensePlate.label" default="License Plate" /></span>
					
						<span class="property-value" aria-labelledby="licensePlate-label"><g:fieldValue bean="${truckInstance}" field="licensePlate"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:truckInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${truckInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
