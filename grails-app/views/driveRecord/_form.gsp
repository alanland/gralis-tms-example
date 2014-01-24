<%@ page import="tms.example.DriveRecord" %>



<div class="fieldcontain ${hasErrors(bean: driveRecordInstance, field: 'date', 'error')} required">
    <label for="date">
        <g:message code="driveRecord.date.label" default="Date"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="date" precision="day" value="${driveRecordInstance?.date}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: driveRecordInstance, field: 'driver', 'error')} required">
    <label for="driver">
        <g:message code="driveRecord.driver.label" default="Driver"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="driver" name="driver.id" from="${tms.example.Driver.list()}" optionKey="id" required=""
              value="${driveRecordInstance?.driver?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: driveRecordInstance, field: 'truck', 'error')} required">
    <label for="truck">
        <g:message code="driveRecord.truck.label" default="Truck"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="truck" name="truck.id" from="${tms.example.Truck.list()}" optionKey="id" required=""
              value="${driveRecordInstance?.truck?.id}" class="many-to-one"/>
</div>

