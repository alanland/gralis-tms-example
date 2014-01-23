
<%@ page import="tms.example.Driver" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'driver.label', default: 'Driver')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-driver" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-driver" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list driver">
			
				<g:if test="${driverInstance?.drivingLicenseNo}">
				<li class="fieldcontain">
					<span id="drivingLicenseNo-label" class="property-label"><g:message code="driver.drivingLicenseNo.label" default="Driving License No" /></span>
					
						<span class="property-value" aria-labelledby="drivingLicenseNo-label"><g:fieldValue bean="${driverInstance}" field="drivingLicenseNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${driverInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="driver.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${driverInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${driverInstance?.trucks}">
				<li class="fieldcontain">
					<span id="trucks-label" class="property-label"><g:message code="driver.trucks.label" default="Trucks" /></span>
					
						<g:each in="${driverInstance.trucks}" var="t">
						<span class="property-value" aria-labelledby="trucks-label"><g:link controller="truck" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:driverInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${driverInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
