



func loveCalculator() {
    
    let randomNum = Int.random(in: 0...100)
    /* if solution
    if randomNum > 80 {
        print("You love each other like Kanye loves Kanye")
    }
    else if randomNum > 40 {
        print("You go together like Coke and Mentos")
    }
    else {
        print("You'll be forever alone")
    }
    */
    
    //switch-case solution
    
    switch randomNum {
    case _ where randomNum > 80:
        print("You love each other like Kanye loves Kanye")
    case 41..<80:
        print("You go together like Coke and Mentos")
    case ...40:
        print("You'll be forever alone")
    default:
        print("Error, out of range")
    }
    
}





//loveCalculator()


var aYear = 1200

func isLeap(year: Int) {
    
    //year is not divisible by 4 (normal year)
    if aYear%4 != 0 {
     //   print("module 4: \(aYear%4)")
        print("NO")
    }
    //year is not divisible by 100 (is a leap year)
    else if aYear%100 != 0 {
      //  print("module 100: \(aYear%100)")
        print("YES")
    }
    //year is not divisible by 400 (normal year)
    else if aYear%400 != 0 {
       // print("module 400: \(aYear%400)")
        print("NO")
    }
    //is a leap year
    else {
       // print("Else")
        print("YES")
    }
    
    
}

//isLeap(year: aYear)




func dayOfTheWeek(day: Int) {
  
  //Write your code inside this function.
  
    switch day{
    case 1:
        print("Monday")
    case 2:
        print("Tuesday")
    case 3:
        print("Wednesday")
    case 4:
        print("Thursday")
    case 5:
        print("Friday")
    case 6:
        print("Saturday")
    case 7:
        print("Sunday")
    default:
        print("The numbers have to be between 1 and 7")
    }
  
  
}

dayOfTheWeek(day: 3)
