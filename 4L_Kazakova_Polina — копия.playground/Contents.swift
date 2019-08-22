import UIKit

enum CarColor {
    case black, white, multicolor, red, blue
}
enum DoorState {
    case open, close, unknown
}
enum Engine {
    case on, off
}
class Car {
    static var count: Int = 0
    static func printCounter() {
        var correctlyWrite = "машины"
        let reminder = count % 10
        switch reminder {
        case 1,2:
            if count == 1 && count != 11{
                correctlyWrite = "машина"
            }
        case 3, 4, 5:
            if count != 2 && count != 3 && count != 4{
                correctlyWrite = "машин"
            }
        default:
            break
        }
        print("Сейчас выпущено уже \(count) \(correctlyWrite).")
    }
    let carModel: String
    var carPrice: Double
    var age: Int
    var weight: Double
    let carColor: CarColor
    var doorState: DoorState {
        willSet{
            if newValue == .open{
                print ("Двери сейчас откроются")
            }else{
                print ("Двери сейчас закроются")
            }
        }
    }
    var engine: Engine
    var description: String {
    get {
        return (" Модель: \(carModel) возраст: \(age) цена: \(carPrice) вес: \(weight) цвет: \(carColor)")
        }
    }
    init (carModel: String, age: Int = 0, weight: Double, carColor: CarColor, doorState: DoorState, engine: Engine, carPrice: Double){
        Car.count += 1
        self.carModel = carModel
        self.age = age
        self.weight = weight
        self.carColor = carColor
        self.doorState = doorState
        self.engine = engine
        self.carPrice = carPrice
    }
    func printDoorState() {
        print ("В автомобиле \(carModel) положение дверей \(doorState)")
        }
    func closingDoor() {
        self.doorState = .close
        print ("The doors are \(doorState)")
    }
    func openingDoor() {
        self.doorState = .open
        print ("The doors are \(doorState)")
    }
    func cheepCar() {
        var newPrice = carPrice
        newPrice -= 20000
        carPrice = newPrice
        print ("Скидка на автомобиль \(carModel) 20000 рублей")
    }
    deinit {
        print("Одну машину утилизировали")
        Car.count -= 1
    }
}



enum Spoiler{
    case ctyleOEM, customStyle, noSpoiler
}
enum Pilot{
    case professional, amateur, beginner
}
class SportCar: Car {
    let spoiler: Spoiler
    var pilot: Pilot?{
        willSet{
            print ("При изменении типа пилота может измениться максимальная скорость автомобиля")
        }
    }
    var maxSpeed: Double
    override var description: String {
        get{
            return (" Модель: \(carModel) возраст: \(age) цена: \(carPrice) вес: \(weight) цвет: \(carColor) max speed: \(maxSpeed)")
        }
    }
    init (carModel: String, age: Int = 0, weight: Double, carColor: CarColor, doorState: DoorState, engine: Engine, carPrice: Double, spoiler: Spoiler, pilot: Pilot?, maxSpeed: Double){
    self.spoiler = spoiler
    self.pilot = pilot
    self.maxSpeed = maxSpeed
    super.init(carModel: carModel, weight: weight, carColor: carColor, doorState: doorState, engine: engine, carPrice: carPrice)
    }
    override func cheepCar() {
        super.cheepCar()
         print ("Это самая лучшая цена на автомобиль \(carModel) в этом году")
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
enum FuelTipe{
    case electricity, petrol, diesel
}
class TruckCar: Car {
    var carrying: Double
    var fuelType: FuelTipe
    override var description: String {
        get{
            return (" Модель: \(carModel) возраст: \(age) цена: \(carPrice) вес: \(weight) цвет: \(carColor) грузоподъёмность: \(carrying) тип топлива: \(fuelType)")
        }
    }
    init(carModel: String, age: Int = 0, weight: Double, carColor: CarColor, doorState: DoorState, engine: Engine, carPrice: Double, carrying: Double, fuelType: FuelTipe) {
    self.carrying = carrying
    self.fuelType = fuelType
    super.init(carModel: carModel, age: age, weight: weight, carColor: carColor, doorState: doorState, engine: engine, carPrice: carPrice)
    }
        override func cheepCar(){
            super.cheepCar()
            print ("Лучшая скидка на автомобиль \(carModel)")
        }
    }

class SuperCar: SportCar {
    var engineVolume: Double
    override var description: String {
        get{
            return (" Модель: \(carModel) возраст: \(age) цена: \(carPrice) вес: \(weight) цвет: \(carColor) объём двигателя \(engineVolume)")
        }
    }
    init(carModel: String, age: Int = 0, weight: Double, carColor: CarColor, doorState: DoorState, engine: Engine, carPrice: Double, spoiler: Spoiler, pilot: Pilot?, maxSpeed: Double, engineVolume: Double) {
        self.engineVolume = engineVolume
        super.init(carModel: carModel, age: age, weight: weight, carColor: carColor, doorState: doorState, engine: engine, carPrice: carPrice, spoiler: spoiler, pilot: pilot, maxSpeed: maxSpeed)
    }
   
}

var porsche911: SportCar = SportCar(carModel: "porsche 911", age: 0, weight: 1600, carColor: .black, doorState: .unknown, engine: .off, carPrice: 5000000, spoiler: .customStyle, pilot: .beginner, maxSpeed: 350)
var teslaSemi: TruckCar = TruckCar(carModel: "Tesla Semi", age: 0, weight: 3200, carColor: .white, doorState: .unknown, engine: .off, carPrice: 20000000, carrying: 36000, fuelType: .electricity)
Car.printCounter()
print (porsche911.description)
print (teslaSemi.description)
porsche911.cheepCar()
porsche911.doorState = .open
porsche911.pilot = nil
porsche911.speedCar()
print (porsche911.description)
var marussia: SuperCar = SuperCar (carModel: "Marussia B2", age: 1, weight: 1300, carColor: .red , doorState: .close, engine: .on, carPrice: 5300000, spoiler: .ctyleOEM, pilot: .professional, maxSpeed: 520, engineVolume: 2.8)
print (marussia.description)
Car.printCounter()
