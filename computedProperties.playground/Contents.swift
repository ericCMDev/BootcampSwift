import Foundation

//stored properties

let slicesPerPerson: Int = 5
var numberOfPeople: Int = 10



//computed properties
var numberOfSlices: Int {
    return pizzaInInches - 4
}

//observed propierties
var pizzaInInches: Int = 12 {
//newValue i oldValue són keywords que sempre és el nou i antic valor de la variable (en aquest cas de pizzaInInches)
    willSet {
        //print(newValue)
    }
    didSet {
        //print(oldValue)
        if pizzaInInches >= 18 {
            print("La mida de la pizza no és vàlida, s'ha modificat a la mida màxima (18).")
            pizzaInInches = 18
        }
    }
}

pizzaInInches = 19
print(pizzaInInches)


//getters i setters
var numberOfPizza: Int {
    get {
        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
        return numberOfPeople / numberOfPeopleFedPerPizza
    }
    set {
        //newValue són keywords que sempre és el nou valor de la variable (en aquest cas numberOfPizza)
        let totalSlices = numberOfSlices * newValue
        numberOfPeople = totalSlices / slicesPerPerson
    }
}

numberOfPizza = 4

print(numberOfPeople)
