//protocols practice


protocol CanFly {
    func fly()
}

class Bird {
    var isFemale = true
    
    func layEgg(){
        if isFemale {
            print("The bird makes a new bird in a shell")
        }
    }
    
}

class Eagle: Bird, CanFly {
    func fly() {
        print("The eagle flaps ets wings and lifts off into the sky.")
    }
    
    func soar() {
        print("The eagle glides in the air using air currents.")
    }
}

class Penguin: Bird {
    func swim() {
        print("The penguin paddles throw the water.")
    }
}

struct FlyingMuseum {
    func fyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}

struct Airplane: CanFly {
    func fly() {
        print("The airplane uses its engine to lift off into the air.")
    }
    
    
}

let myEagle = Eagle()
myEagle.fly()


let myPenguin = Penguin()
myPenguin.swim()

let myPlane = Airplane()
myPlane.fly()

let museum = FlyingMuseum()
museum.fyingDemo(flyingObject: myPlane)



