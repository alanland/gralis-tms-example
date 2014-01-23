package tms.example



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TruckController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Truck.list(params), model:[truckInstanceCount: Truck.count()]
    }

    def show(Truck truckInstance) {
        respond truckInstance
    }

    def create() {
        respond new Truck(params)
    }

    @Transactional
    def save(Truck truckInstance) {
        if (truckInstance == null) {
            notFound()
            return
        }

        if (truckInstance.hasErrors()) {
            respond truckInstance.errors, view:'create'
            return
        }

        truckInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'truckInstance.label', default: 'Truck'), truckInstance.id])
                redirect truckInstance
            }
            '*' { respond truckInstance, [status: CREATED] }
        }
    }

    def edit(Truck truckInstance) {
        respond truckInstance
    }

    @Transactional
    def update(Truck truckInstance) {
        if (truckInstance == null) {
            notFound()
            return
        }

        if (truckInstance.hasErrors()) {
            respond truckInstance.errors, view:'edit'
            return
        }

        truckInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Truck.label', default: 'Truck'), truckInstance.id])
                redirect truckInstance
            }
            '*'{ respond truckInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Truck truckInstance) {

        if (truckInstance == null) {
            notFound()
            return
        }

        truckInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Truck.label', default: 'Truck'), truckInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'truckInstance.label', default: 'Truck'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
