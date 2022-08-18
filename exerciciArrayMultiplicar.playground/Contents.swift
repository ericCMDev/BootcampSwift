
func exercise() {

    let numbers = [45, 73, 195, 53]
    
    //Write your code here
    var computedNumbers = [Int]()
    
    for i in 0 ..< numbers.count-1{
        computedNumbers.append(numbers[i] * numbers[i+1])
    }
    computedNumbers.append(numbers[3] * numbers[0])
    print(computedNumbers)

}
