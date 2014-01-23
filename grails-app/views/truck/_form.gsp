<%@ page import="tms.example.Truck" %>



<div class="fieldcontain ${hasErrors(bean: truckInstance, field: 'drivers', 'error')} ">
	<label for="drivers">
		<g:message code="truck.drivers.label" default="Drivers" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: truckInstance, field: 'licensePlate', 'error')} ">
	<label for="licensePlate">
		<g:message code="truck.licensePlate.label" default="License Plate" />
		
	</label>
	<g:textField name="licensePlate" value="${truckInstance?.licensePlate}"/>
</div>

