import UIKit

enum FactoryError: Error {
    case workerNotFound
    case positionNotFound
    case salaryFondIsEmpty (needed: Double)
}

struct Position {
    let name: String
}

struct Worker {
    let position: Position
    var salary: Double
    var workerCount: Int
}

class Factory {
    
    var staff = [
        "Плотник": Worker(position: Position(name: "Carpenter"), salary: 20000, workerCount: 5),
        "Электрик": Worker(position: Position(name: "Electrician"), salary: 22000, workerCount: 2),
        "Манагер": Worker(position: Position(name: "Manager"), salary: 30000, workerCount: 10),
        "Дезайнер": Worker(position: Position(name: "Designer"), salary: 200000, workerCount: 0)
    ]
    
    func employees (name: String) throws -> Position {
        
        // если такой позиции в штате нет
        guard let worker = staff [name] else {throw FactoryError.positionNotFound}
        
        // если место вакантно
        guard worker.workerCount > 0 else {throw FactoryError.workerNotFound}
        
        // наличие возможности оплатить услуги сотрудника
        guard worker.salary <= salaryFond else {throw FactoryError.salaryFondIsEmpty(needed: worker.salary - salaryFond)}
        salaryFond -= worker.salary
        return worker.position
    }
    var salaryFond: Double = 0
    
}

var minifactory = Factory()
minifactory.salaryFond = 10000


var dataStaff = [
    "Ivanov" : "Carpenter",
    "Sidorov" : "Electrician",
    "Vasechkin" : "Manager",
    "Smirnov" : "Designer"
]

enum DataError: Error {
    case dataNotFound
}

func whoAreU (person: String, factory: Factory) throws -> Position {
    
    guard let data = dataStaff[person] else { throw DataError.dataNotFound }
    
    return try factory.employees(name: data)
}

do {
    try whoAreU(person: "Sinicin", factory: minifactory)
} catch DataError.dataNotFound{
    print ("Сотрудник с таким именем не найден")
} catch FactoryError.workerNotFound{
    print ("Такого сотрудника нет")
} catch FactoryError.positionNotFound{
    print ("Такой позиции нет в штате")
} catch FactoryError.salaryFondIsEmpty(let needed){
    print ("Фабрике необходимо \(needed) для оплаты труда такого сотрудника")
} catch let error {
    print (error)
}

do {
    try whoAreU(person: "Vasechkin", factory: minifactory)
} catch DataError.dataNotFound{
    print ("Сотрудник с таким именем не найден")
} catch FactoryError.workerNotFound{
    print ("Такого сотрудника нет")
} catch FactoryError.positionNotFound{
    print ("Такой позиции нет в штате")
} catch FactoryError.salaryFondIsEmpty(let needed){
    print ("Фабрике необходимо \(needed) для оплаты труда такого сотрудника")
} catch let error {
    print (error)
}

