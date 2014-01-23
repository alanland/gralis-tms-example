package tms.example

class Driver {

    String name
    String drivingLicenseNo
    static hasMany = [trucks: Truck]
    static constraints = {
    }

    @Override
    String toString() {
        return "$name - $drivingLicenseNo"
    }
}
