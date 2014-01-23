<%@ page import="tms.example.Truck" %>



<div class="fieldcontain ${hasErrors(bean: truckInstance, field: 'drivers', 'error')} ">
	<label for="drivers">
		<g:message code="truck.drivers.label" default="Drivers" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: truckInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="truck.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${truckInstance?.name}"/>
</div>

