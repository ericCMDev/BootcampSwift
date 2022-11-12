protocol AdvancedLifeSupport {
    //info: CPR és CardioPulmonaryResuscitation
    func performCPR()
}

class EmergencyCallHandler {
    var delegate: AdvancedLifeSupport?
    
    func assessSituation() {
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}


struct Paramedic: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler){
        handler.delegate =  self
    }

    func performCPR() {
        print("The paramedic does chest compressions, 30 per seconds.")
    }

}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per seconds.")
    }

    func useStethescope(){
        print("Listening for heart sounds.")
    }
  
}

class Surgeon: Doctor {
    
    override func performCPR() {
        //executem la funció heretada del Doctor i li afegim més funcions (en aquest cas el print del sings staying alive...)
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill(){
        print("Whirr...")
    }
    
}


let emilio = EmergencyCallHandler()
let angela = Surgeon(handler: emilio)
    
emilio.assessSituation()
emilio.medicalEmergency()
