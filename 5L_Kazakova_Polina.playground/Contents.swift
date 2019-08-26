import UIKit

enum CarType{
    case bike, car, truck, bus
}
enum CarColor{
    case white, black, green, blue, red, multicolor
}
enum DoorState {
    case open, close, unknown
}
enum Engine {
    case on, off
}
protocol CarConstructable: class{
    var carType: CarType {get}
    var carModel: String {get}
    var carPrice: Double {get set}
    var carColor: CarColor {get}
    var engineVolume: Double {get}
    var engine: Engine {get set}
    var doorState: DoorState {get set}
    
    func cheepCar () -> Double
}

extension CarConstructable {
    func printDoorState() {
    print ("В автомобиле \(carModel) положение дверей \(doorState)")
    }
}
extension CarConstructable {
    func closingDoor() {
        doorState = .close
        print ("The doors are \(doorState)")
    }
    func openingDoor() {
        doorState = .open
        print ("The doors are \(doorState)")
}
}

enum Spoiler{
    case ctyleOEM, customStyle, noSpoiler
}
enum Pilot{
    case professional, amateur, beginner
}
class SportCar: CarConstructable {
    var carType: CarType
    var carModel: String
    var carPrice: Double
    var carColor: CarColor
    var engineVolume: Double
    var engine: Engine
    var doorState: DoorState
    func cheepCar() -> Double {
        var newPrice = carPrice
        newPrice -= 20000
        carPrice = newPrice
        return carPrice
    }
    let spoiler: Spoiler
    var pilot: Pilot?{
        willSet{
            print ("При изменении типа пилота может измениться максимальная скорость автомобиля")
        }
    }
    var maxSpeed: Double
    init (carType: CarType, carModel: String, carPrice: Double, carColor: CarColor, engineVolume: Double, engine: Engine, doorState: DoorState, spoiler: Spoiler, pilot: Pilot, maxSpeed: Double){
        self.carType = carType
        self.carModel = carModel
        self.carPrice = carPrice
        self.carColor = carColor
        self.engineVolume = engineVolume
        self.engine = engine
        self.doorState = doorState
        self.spoiler = spoiler
        self.pilot = pilot
        self.maxSpeed = maxSpeed
    }
    func speedCar() {
        if pilot == .professional{
            maxSpeed = 350.00
        }else if pilot == .amateur{
            maxSpeed = 250.00
        }else if pilot == .beginner{
            maxSpeed = 180.00
        }else{
            maxSpeed = 0
        }
    }
}
extension SportCar: CustomStringConvertible{
    var description: String {
        return "Модель: \(carModel) Тип автомобиля: \(carType) Цена: \(carPrice) Цвет: \(carColor) Объём: \(engineVolume)"
    }
}

enum FuelTipe{
    case electricity, petrol, diesel
}
class TruckCar: CarConstructable{
    var carType: CarType
    var carModel: String
    var carPrice: Double
    var carColor: CarColor
    var engineVolume: Double
    var engine: Engine
    var doorState: DoorState
    func cheepCar() -> Double {
        var newPrice = carPrice
        newPrice -= 20000
        carPrice = newPrice
        return carPrice
    }
    var fuelType: FuelTipe
   
    init(carType: CarType, carModel: String, carPrice: Double, carColor: CarColor, engineVolume: Double, engine: Engine, doorState: DoorState, fuelType: FuelTipe){
        self.carType = carType
        self.carModel = carModel
        self.carPrice = carPrice
        self.carColor = carColor
        self.engineVolume = engineVolume
        self.engine = engine
        self.doorState = doorState
        self.fuelType = fuelType
    }
}

extension TruckCar: CustomStringConvertible{
    var description: String {
        return "Модель: \(carModel) Тип автомобиля: \(carType) Цена: \(carPrice) Цвет: \(carColor) Объём двигателя: \(engineVolume)"
    }
}
var miniCooper = SportCar(carType: .car , carModel: "John Cooper Works", carPrice: 2500000, carColor: .black, engineVolume: 2.8, engine: .off, doorState: .unknown, spoiler: .customStyle, pilot: .amateur, maxSpeed: 350)
var tesla = TruckCar(carType: .truck, carModel: "Tesla Semi", carPrice: 20000000, carColor: .white, engineVolume: 0, engine: .off, doorState: .open, fuelType: .electricity)
print(miniCooper)
print(tesla)
tesla.cheepCar()
miniCooper.printDoorState()
tesla.closingDoor()
tesla.printDoorState()



