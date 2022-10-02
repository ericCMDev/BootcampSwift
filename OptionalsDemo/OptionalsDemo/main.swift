//let myOptional : String?

//myOptional = nil

//optional Binding
/*if let safeOptional = myOptional {
    let text: String = safeOptional
    let text2: String = safeOptional
    print(safeOptional)
} else {
    print("myOptional was found to be nil")
}
*/


//default values to optionals
/*
let text: String = myOptional ?? "I am the default value"

print(text)

*/

//optional Struct
struct MyOptional {
    var property = 123
    func method(){
        print("I am the struct's method.")
    }
}

let myOptional : MyOptional?

//myOptional = MyOptional()

myOptional = nil
//optional chaining (retornarà nil sempre que no hi hagi valor, però no petaràel programa)
print(myOptional?.property)
print(myOptional?.method())









