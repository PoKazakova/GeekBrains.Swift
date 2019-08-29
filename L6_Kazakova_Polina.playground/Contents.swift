import UIKit

var bootWeight: Double = 200
protocol Weightable{
    var weight: Double{get set}
}
protocol Volumeable{
    func volume() -> Double
}
class Box: Weightable, Volumeable{
    var weight: Double

    var sideA: Double
    var sideB: Double
    var sideC: Double
    func volume() -> Double{
        return sideA * sideB * sideC
    }
    init(sideA: Double, sideB: Double, sideC: Double, weight: Double) {
        self.sideA = sideA
        self.sideB = sideB
        self.sideC = sideC
        self.weight = weight
    }
}
class Cylinder: Weightable, Volumeable{
    var weight: Double
   
    var radius: Double
    var height: Double
    func volume() -> Double{
        return .pi * (radius * radius) * height
    }
    init(weight: Double, radius: Double, height: Double) {
        self.height = height
        self.weight = weight
        self.radius = radius
    }
}
struct Queue <T:Weightable> {
    private var boxes: [T] = []
    mutating func push(_ box: T) {
        boxes.append(box)
    }
    
    mutating func pop() -> T? {
        guard boxes.count > 0 else { return nil }
        return boxes.removeFirst()
    }
    
    func totalWeight() {
        guard boxes.count > 0 else { return }
        var totalWeight: Double = 0
        boxes.forEach { totalWeight += $0.weight }
        print("Вес всех коробок: ", totalWeight)
    }
    
    subscript(boxes: Int...) -> Double {
        var weight: Double = 0
        
        for index in boxes where index < self.boxes.count {
            weight += self.boxes[index].weight
        }
        
        return weight
    }
    
    subscript(box: String) -> Int {
        return 0
    }
}
var yourGoods = Queue<Box>()
var maGoods = Queue<Cylinder>()
var ourGoodsWeight = [0.0]

maGoods.push(Cylinder(weight: 5.5, radius: 10, height: 30))
maGoods.push(Cylinder(weight: 10, radius: 45, height: 40))
maGoods.push(Cylinder(weight: 1.45, radius: 45, height: 40))
maGoods.push(Cylinder(weight: 6.3, radius: 45, height: 40))
yourGoods.push(Box(sideA: 30, sideB: 40, sideC: 30, weight: 6.3))
yourGoods.push(Box(sideA: 40, sideB: 40, sideC: 30, weight: 7.7))
yourGoods.push(Box(sideA: 40, sideB: 40, sideC: 30, weight: 9.2))
yourGoods.push(Box(sideA: 40, sideB: 40, sideC: 30, weight: 211))

ourGoodsWeight.append(maGoods[0])
ourGoodsWeight.append(yourGoods[0])
ourGoodsWeight.append(maGoods[1])
ourGoodsWeight.append(yourGoods[1])
ourGoodsWeight.append(maGoods[2])
ourGoodsWeight.append(yourGoods[2])
ourGoodsWeight.append(maGoods[3])
ourGoodsWeight.append(yourGoods[3])
print (ourGoodsWeight)
var sum = ourGoodsWeight.reduce(0,+)
print (sum)
yourGoods.totalWeight()
maGoods.totalWeight()
yourGoods[0,1,3,90]


maGoods.pop()
maGoods.totalWeight()





