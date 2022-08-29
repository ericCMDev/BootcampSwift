import Darwin

//exemple molt simple d'utilitzar una funció
func greeting() {
    
    for _ in  0...3 {
        print("Hello")
    }
}

greeting()

func greeting2(whoToGreet: String) {
    print("Hello \(whoToGreet)")
}

greeting2(whoToGreet: "Eric")


func calculator() {
  let a = 3 //First input
  let b = 4 //Second input
  
    func add(n1: Int, n2:Int){
        print(n1+n2)
    }
    func subtract(n1: Int, n2:Int){
        print(n1-n2)
    }
    func multiply(n1: Int, n2:Int){
        print(n1*n2)
    }
    func divide(n1: Float, n2:Float){
        print(n1/n2)
    }
  add(n1: a, n2: b)
  subtract(n1: a, n2: b)
  multiply(n1: a, n2: b)
  divide(n1: Float(a), n2: Float(b))
  
}

calculator()



func isOdd(n: Int) -> Bool {
    
    if n % 2 != 0 {
        return true
    }
    else {
        return false
    }
}



