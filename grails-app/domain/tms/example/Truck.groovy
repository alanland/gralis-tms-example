package tms.example

class Truck {

    String licensePlate
//    static hasMany = [drivers: Driver]
//    static belongsTo = [Driver]
    static constraints = {
    }

    @Override
    String toString() {
        return "$licensePlate"
    }
}
