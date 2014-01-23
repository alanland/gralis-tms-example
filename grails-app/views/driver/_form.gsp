<%@ page import="tms.example.Driver" %>



<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="driver.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${driverInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: driverInstance, field: 'trucks', 'error')} ">
	<label for="trucks">
		<g:message code="driver.trucks.label" default="Trucks" />
		
	</label>
	<g:select name="trucks" from="${tms.example.Truck.list()}" multiple="multiple" optionKey="id" size="5" value="${driverInstance?.trucks*.id}" class="many-to-many"/>
</div>

