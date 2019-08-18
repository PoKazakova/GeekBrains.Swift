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
struct Car {
    let carModel: String
    var carPrice: Double
    var age: Int
    var bootVolume: Double {
        willSet {
            print ("В багажнике останется \(bootVolume - newValue) литр(ов) для вашего багажа")
        }
    }
    var weight: Double
    var doors: Int{
        didSet {
            print("Вы потеряли \(oldValue - doors) дверь")
        }
    }
    let carColor: CarColor
    var doorState: DoorState
    var engine: Engine
    var description: String {
    get {
        return (" Модель: \(carModel) возраст: \(age) цена: \(carPrice) вес: \(weight) количество дверей: \(doors) цвет: \(carColor)")
        }
    }
    init (carModel: String, age: Int = 0, bootVolume: Double, weight: Double, doors: Int = 4, carColor: CarColor, doorState: DoorState, engine: Engine, carPrice: Double){
        self.carModel = carModel
        self.age = age
        self.bootVolume = bootVolume
        self.weight = weight
        self.doors = doors
        self.carColor = carColor
        self.doorState = doorState
        self.engine = engine
        self.carPrice = carPrice
    }
    func printDoorState() {
        print ("В автомобиле \(carModel) положение дверей \(doorState)")
        }
    mutating func closingDoor() {
        self.doorState = .close
        print ("The doors are \(doorState)")
    }
    mutating func openingDoor() {
        self.doorState = .open
        print ("The doors are \(doorState)")
    }
    mutating func cheepCar() {
        var newPrice = carPrice
        newPrice -= 20000
        carPrice = newPrice
        print ("Скидка на автомобиль \(carModel) 20000 рублей")
    }
}

var miniCooper = Car (carModel: "mini", age: 0, bootVolume: 211, weight: 1800, doors: 3, carColor: .white, doorState: .unknown, engine: .off, carPrice: 2000000)
var kamaz = Car (carModel: "kamaz", age: 0, bootVolume: 6520, weight: 8000, doors: 2, carColor: .multicolor, doorState: .unknown, engine: .off, carPrice: 4000000)
print (miniCooper.description)
print (kamaz.description)
kamaz.closingDoor()
kamaz.printDoorState()
miniCooper.closingDoor()
miniCooper.printDoorState()
kamaz.cheepCar()
print (kamaz.description)
miniCooper.doors = 2
miniCooper.bootVolume = 20
print (miniCooper.description)

