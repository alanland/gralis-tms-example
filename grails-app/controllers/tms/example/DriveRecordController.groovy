package tms.example



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DriveRecordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DriveRecord.list(params), model: [driveRecordInstanceCount: DriveRecord.count()]
    }

    def show(DriveRecord driveRecordInstance) {
        respond driveRecordInstance
    }

    def create() {
        respond new DriveRecord(params)
    }

    @Transactional
    def save(DriveRecord driveRecordInstance) {
        if (driveRecordInstance == null) {
            notFound()
            return
        }

        if (driveRecordInstance.hasErrors()) {
            respond driveRecordInstance.errors, view: 'create'
            return
        }

        driveRecordInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'driveRecordInstance.label', default: 'DriveRecord'), driveRecordInstance.id])
                redirect driveRecordInstance
            }
            '*' { respond driveRecordInstance, [status: CREATED] }
        }
    }

    def edit(DriveRecord driveRecordInstance) {
        respond driveRecordInstance
    }

    @Transactional
    def update(DriveRecord driveRecordInstance) {
        if (driveRecordInstance == null) {
            notFound()
            return
        }

        if (driveRecordInstance.hasErrors()) {
            respond driveRecordInstance.errors, view: 'edit'
            return
        }

        driveRecordInstance.save flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DriveRecord.label', default: 'DriveRecord'), driveRecordInstance.id])
                redirect driveRecordInstance
            }
            '*' { respond driveRecordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DriveRecord driveRecordInstance) {

        if (driveRecordInstance == null) {
            notFound()
            return
        }

        driveRecordInstance.delete flush: true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DriveRecord.label', default: 'DriveRecord'), driveRecordInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'driveRecordInstance.label', default: 'DriveRecord'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
