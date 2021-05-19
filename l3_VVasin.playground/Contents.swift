import UIKit

enum engineState {
    case start, stop
}

enum AreWindowsOpen {
    case open, close
}

enum trunkState {
    case full, empty
}

struct car {
    let brandAuto : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "белый":
            self.color = "белый"
        case "черный":
            self.color = "черный"
        case "серый":
            self.color = "серый"
        case "синий":
            self.color = "синий"
        default:
            print("Ошибка")
        }
    }
    let yearOfManufacture : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brandAuto) объем багажника: \(space)")
            } else { print("Ошибка или \(brandAuto) багажник полный.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandAuto) двигатель включен")
            } else {print("\(brandAuto) двигатель выключен")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandAuto) окно открыто")
            } else { print("\(brandAuto) окно закрыто") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandAuto) багажник пустой")
    }
}

struct truck {
    let brandTruck : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "белый":
            self.color = "белый"
        case "черный":
            self.color = "черный"
        case "красный":
            self.color = "красный"
        case "синий":
            self.color = "синий"
        default:
            print("Ошибка.")
        }
    }
    let yearOfManufacture : Int
    var truckVolume : Double {
        willSet {
            if (trunkState == .empty) && (truckVolume > 0) && (truckVolume != 0) && (newValue < truckVolume) {
                let space = truckVolume - newValue
                print ("\(brandTruck) объем багажника: \(space)")
            } else { print("Ошибка или \(brandTruck) багажник полный.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brandTruck) двигатель включен")
            } else {print("\(brandTruck) двигатель выключен")}
        }
    }
    var AreWindowsOpen : AreWindowsOpen {
        willSet {
            if newValue == .open {
                print("\(brandTruck) окно открыто")
            } else { print("\(brandTruck) окно закрыто") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brandTruck) багажник пустой")
    }
}

var car1 = car(brandAuto: "Жигули",  color: "clear", yearOfManufacture: 2006, trunkVolume: 320.0 , engineState: .stop, AreWindowsOpen: .open, trunkState: .empty)
var car2 = car(brandAuto: "Волга",  color: "clear", yearOfManufacture: 2004, trunkVolume: 520.0, engineState: .stop, AreWindowsOpen: .close, trunkState: .full)

var truck1 = truck(brandTruck: "Газель",  color: "clear", yearOfManufacture: 2004, truckVolume: 3500.0, engineState: .start, AreWindowsOpen: .open, trunkState: .full)
var truck2 = truck(brandTruck: "ГазNext",  color: "clear", yearOfManufacture: 2020, truckVolume: 5000.0, engineState: .start, AreWindowsOpen: .close, trunkState: .empty)

car1.engineState = .start
car1.trunkVolume = 300.0
car1.changeColor(c: "красный")
car2.trunkVolume = 500.0
car2.emptyTrunck()
car2.trunkVolume = 80.9
car2.AreWindowsOpen = .open
car2.changeColor(c: "черный")

truck1.engineState = .stop
truck1.AreWindowsOpen = .close
truck2.AreWindowsOpen = .open
truck2.engineState = .stop
truck2.truckVolume = 4800
truck2.changeColor(c: "белый")
truck2.color
