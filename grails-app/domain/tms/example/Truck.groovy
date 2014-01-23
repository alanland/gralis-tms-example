package tms.example

class Truck {

    String name
    static hasMany = [drivers: Driver]
    static belongsTo = [Driver]
    static constraints = {
    }
}
