import Foundation

var width: Float = 1.5
var height: Float = 2.3
var necesaryBuckets: Int

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedUpBuckets = ceilf(numberOfBuckets)
        return Int(roundedUpBuckets)
    }
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("This amount of paint can cover an area of \(areaCanCover)")
    }
    
}

bucketsOfPaint = 2
print(bucketsOfPaint)
