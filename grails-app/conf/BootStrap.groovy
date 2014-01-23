import tms.example.Driver
import tms.example.Truck

class BootStrap {

    def init = { servletContext ->
        def t1 = new Truck(licensePlate: '豫A01').save()
        def t2 = new Truck(licensePlate: '豫A02').save()
        def t3 = new Truck(licensePlate: '豫A03').save()
        def t4 = new Truck(licensePlate: '豫A04').save()
        def d1 = new Driver(name: '张三', drivingLicenseNo: 'X01', trucks: [t1, t2, t3]).save()
        def d2 = new Driver(name: '李四', drivingLicenseNo: 'X02', trucks: [t2, t4]).save()
        def d3 = new Driver(name: '王五', drivingLicenseNo: 'X03', trucks: [t1, t2, t3, t4]).save()
        def d4 = new Driver(name: '赵六', drivingLicenseNo: 'X04', trucks: [t3, t4]).save()

    }
    def destroy = {
    }
}
