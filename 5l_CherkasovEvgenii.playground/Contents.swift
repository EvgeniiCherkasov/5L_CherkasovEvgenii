import UIKit

protocol Car{
    
    var mark: String {get set}
    var year: Int {get set}
    var valumeOfTrunk: Int {get set}
    var isEngineStarted: Bool {get set}
    var isWindowOpen: Bool  {get set}
    var fullnesOfTrunk: Int {get set}
    
    associatedtype ActionOfCar
    
    func action(action: ActionOfCar)
    func description()
    
}

extension Car{
    
    mutating func startEngine(){
        if self.isEngineStarted == false{
        self.isEngineStarted = true
            print("Включено зажигание")
        }else{
            print("Двигатель уже запущен.")
        }
    }
}

extension Car{
    
    mutating func stopEngine(){
        
        if self.isEngineStarted == true{
            self.isEngineStarted = false
            print("Зажигание выключено.")
        }else{
            print("Двигатель уже заглушен.")
        }
    }
}

extension Car{
    
    mutating func openWindow(){
        
        if self.isWindowOpen == false{
            self.isWindowOpen = true
            print("Окно открыто.")
        }else{
            print("Окно уже открыто")
        }
    }
}

extension Car{
    
    mutating func closeWindow(){
        
        if self.isWindowOpen == true{
            self.isWindowOpen = false
            print("Окно закрыто.")
        }else{
            print("Окно уже закрыто.")
        }
    }
}

extension Car{
    
    mutating func takeSmthFromTrunk(weight: Int){
        
        if self.fullnesOfTrunk - weight >= 0{
            self.fullnesOfTrunk -= weight
        }else{
            print("Невозможно достать запрашиваемый груз. В багажнике осталось \(self.fullnesOfTrunk)")
        }
    }
}

extension Car{
    
    mutating func putSmthToTrunk(weight: Int){
        
            if self.fullnesOfTrunk + weight <= self.valumeOfTrunk {
            self.fullnesOfTrunk += weight

            }else{
                print("Невозможно положить горуз объемом \(weight). Осталось свободного места \(valumeOfTrunk - fullnesOfTrunk)")
            }
    }
}


class SportCar: Car{
    
    var mark: String
    var year: Int
    var valumeOfTrunk: Int = 100
    var isEngineStarted: Bool = false
    var isWindowOpen: Bool = false
    var fullnesOfTrunk: Int = 0
    var sportModeState: Bool = false
    
    enum ActionOfSportCar {
        case turnSportModeOn
        case turnSportModeOff
    }
    
    typealias ActionOfCar = ActionOfSportCar
    
    init(mark: String, year: Int, valumeOfTrunk: Int){
        self.mark = mark
        self.year = year
        if valumeOfTrunk < 100{
            self.valumeOfTrunk = valumeOfTrunk
        }else{
            self.valumeOfTrunk = 100
            print("Слишком большой обьем багажника для легкового автомобиля. В созданном автомобиле объем уменьшен до 100.")
        }
    }
    
    func action(action: ActionOfSportCar) {
        switch action {
        case .turnSportModeOn:
            if self.sportModeState == false{
                self.sportModeState = true
                print("Включен спорт режим.")
            }else{
                print("Спорт режим уже активирован.")
            }
        case .turnSportModeOff:
            if self.sportModeState == true{
                self.sportModeState = false
                print("Cпорт режим выключен.")
            }else{
                print("Спорт режим уже выключен.")
            }
        }
    }
    
    func description() {
        print("Марка автомобиля \(mark). Год выпуска: \(year). Окно \(isWindowOpen ? "открыто" : "закрыто"). Двигатель \(isEngineStarted ? "запущен" : "заглушен"). Спорт режим \(sportModeState ? "актевирован.": "деактевирован.") Объем багажника: \(valumeOfTrunk). Багажник заполнен на \(fullnesOfTrunk)")
    }
    
}

class TrunkCar: Car{
    
    var mark: String
    var year: Int
    var valumeOfTrunk: Int = 100
    var isEngineStarted: Bool = false
    var isWindowOpen: Bool = false
    var fullnesOfTrunk: Int = 0
    var isTrailerAttached: Bool = false
    var trailerValume: Int = 0
    
    enum ActionOfTrunkCar {
            case attachTrailer
            case unhitchTrailer
    }
    
    typealias ActionOfCar = ActionOfTrunkCar
    
    init(mark: String, year: Int, valumeOfTrunk: Int){
        self.mark = mark
        self.year = year
        
        if valumeOfTrunk > 100{
            self.valumeOfTrunk = valumeOfTrunk
        }else{
            self.valumeOfTrunk = 100
            print("Слишком маленький обьем багажника для грузового автомобиля. В созданном автомобиле объем увеличен до 100.")
        }
    }
    
    func action(action: ActionOfTrunkCar) {
            switch action {
    
            case .attachTrailer:
                if self.isTrailerAttached == false{
                    self.isTrailerAttached = true
                    print("Прицеп присоединен.")
                }else{
                    print("Прицеп уже есть.")
                }
            case .unhitchTrailer:
                if self.isTrailerAttached == true{
                    self.isTrailerAttached = false
                    print("Прицеп отсоединен.")
                }else{
                    print("Прицеп уже снят.")
                }
            }
    }
    
        func description() {
            print("Марка автомобиля \(mark). Год выпуска: \(year). Окно \(isWindowOpen ? "открыто" : "закрыто"). Двигатель \(isEngineStarted ? "запущен" : "заглушен"). Прицеп \(isTrailerAttached ? "присоединен": "отсоединен.") Объем багажника: \(valumeOfTrunk). Багажник заполнен на \(fullnesOfTrunk)")
        }
    
}

var man = TrunkCar(mark: "MAN", year: 2021, valumeOfTrunk: 200)

var bmw = SportCar(mark: "BMW", year: 2020, valumeOfTrunk: 110)

bmw.description()
bmw.startEngine()
bmw.openWindow()
bmw.action(action: .turnSportModeOn)
bmw.putSmthToTrunk(weight: 20)
bmw.description()

man.description()
man.startEngine()
man.openWindow()
man.action(action: .unhitchTrailer)
man.action(action: .attachTrailer)
man.putSmthToTrunk(weight: 300)
man.putSmthToTrunk(weight: 150)
man.description()

