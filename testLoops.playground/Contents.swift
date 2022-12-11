class Assignment {
    
    
    func fibonacci(n: Int) {
        
        var num1 = 1
        var num2 = 0
        var arrayOfNums: [Int] = []
 
        for _ in 0..<n {
            
            arrayOfNums.append(num2)
            let temp = num1 + num2
            num1 = num2
            num2 = temp
            
        }
        print(arrayOfNums)
    
    }
    
    
}
Assignment().fibonacci(n: 10)
