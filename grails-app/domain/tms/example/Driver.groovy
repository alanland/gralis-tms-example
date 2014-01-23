package tms.example

class Driver {

    String name
    static hasMany = [trucks: Truck]
    static constraints = {
    }
}
