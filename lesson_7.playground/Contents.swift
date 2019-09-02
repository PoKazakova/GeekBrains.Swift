import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case outOfStock
    case insufficientFunds(coinsNeeded: Int)
}

struct Item {
    var price: Int
    var count: Int
    let good: Good
}

struct Good {
    let name: String
}

class VendingMachine {
    
    var inventory = [
        "Snikers" : Item(price: 49, count: 5, good: Good(name: "Snikers")),
        "Pocky" : Item(price: 149, count: 2, good: Good(name: "Pocky")),
        "Pepsi" : Item(price: 33, count: 0, good: Good(name: "Pepsi")),
        "Aroy-D" : Item(price: 99, count: 7, good: Good(name: "Aroy-D"))
    ]
    
    var coinsDeposited = 0
    
    func vend(name: String) throws -> Good {
        
        // если товара с таким именем не существует
        guard var item = inventory[name] else { throw VendingMachineError.invalidSelection }
        
        // проверка на наличие товара
        guard item.count > 0 else { throw VendingMachineError.outOfStock }
        
        // проверка на наличие средств
        guard item.price <= coinsDeposited else { throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited) }
        
        coinsDeposited -= item.price
        
        item.count -= 1
        return item.good
        
    }
}

var machine = VendingMachine()

machine.coinsDeposited = 50

let favoriteSnacks = [
    "Alice" : "Bounty",
    "Bob" : "Pepsi",
    "Alex" : "Snikers"
]

enum BuyerError: Error {
    case customerNotFound
}

func buyFavoriteSnack(person: String, machine: VendingMachine) throws -> Good {
    
    guard let snack = favoriteSnacks[person] else { throw BuyerError.customerNotFound }
    
    return try machine.vend(name: snack)
}

do {
    try buyFavoriteSnack(person: "Alex", machine: machine)
} catch BuyerError.customerNotFound {
    print("Не найден товар для данного покупателя")
} catch VendingMachineError.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError.outOfStock {
    print("Данный товар закончился")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Недостаточно средств, необходимо добавить \(coinsNeeded) монет")
} catch let error {
    print(error)
}
