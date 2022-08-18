let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26

    let numberElements = alphabet.count
    
    let password = alphabet[Int.random(in: 0...numberElements)] + alphabet[Int.random(in: 0...numberElements)] + alphabet[Int.random(in: 0...numberElements)] + alphabet[Int.random(in: 0...numberElements)] + alphabet[Int.random(in: 0...numberElements)] + alphabet[Int.random(in: 0...numberElements)]
    
    print(password)
