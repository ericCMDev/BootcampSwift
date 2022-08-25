func exercise() {

    //Don't change this
    var stockTickers: [String: String] = [
        "APPL" : "Apple Inc",
        "HOG": "Harley-Davidson Inc",
        "BOOM": "Dynamic Materials",
        "HEINY": "Heineken",
        "BEN": "Franklin Resources Inc"
    ]
    
    //Write your code here.
    
    stockTickers["WORK"] = "Slack Technologies Inc"
    stockTickers["BOOM"] = "DMC Global Inc"
  
     //Don't modify this
    print(stockTickers["WORK"]!)
    print(stockTickers["BOOM"]!)
}
 

//exercise()


//Don't change this
var studentsAndScores = ["Amy": 88, "James": 55, "Helen": 99]

func highestScore(scores: [String: Int]) {
  
  //Write your code here.
  
    print(scores.values.max()!)

}

highestScore(scores: studentsAndScores)
