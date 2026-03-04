// The Swift Programming Language
// https://docs.swift.org/swift-book



///Calculates the total of a column in a 2D array.
/// Parameters 
///     - Table - the 2D array
///     - Column - the column which the system is calculating the total of
func columnTotal(table: [[Int]], column: Int) {
var sum = 0

for row in table {

    if row.count < column {
        
} else {
    sum += row[column - 1]
}


}
print (sum)
}


/// Calculates the maximum value in 2D array
/// - Parameter array: 2D array
/// - Returns: biggestValue - the maximum value in 2D array.
func maxValue(in array : [[Double]]) -> Double {
    var biggestValue = -100000.00
    for row in array {
        for value in row {
            if value > biggestValue {
                biggestValue = value
            } 
        }
    }
        return biggestValue
    }



@main
struct SwiftPlayground {
    static func main() {




//Task A

let temperatures = [
    [78, 82, 91, 77],
    [65, 70, 68, 61],
    [88, 94, 90, 91]
]

//Prints information about tempertures.
print(temperatures[0])
print(temperatures[1][2])
print(temperatures[2][0])
print(temperatures[1].reduce(0, +) / temperatures[1].count)


//Task B

let table = [
    [2, 4, 6],
    [8, 10, 12],
    [14, 16, 18]
]

//Prints total of table.
var sum = 0
for row in table {
    for value in row {
        print(value)
        sum += value
    }
}
print(sum)



//Task C

let tableB = [
    [3, 5, 7, 9],
    [2, 4],
    [8, 6, 1],
    [10]
]

//Asks user what column they want to ind the total of.
print("What column?")
let input = readLine()!, column:Int = Int(input)! 

columnTotal(table: tableB, column: column)




//Task D


let readings = [
    [1.5, 3.2, 2.8],
    [7.1],
    [4.4, 6.0],
    [5.9, 8.3, 0.7, 2.2]
]

let biggestValue = maxValue(in: readings)

    print("The largest value in the 2D array is \(biggestValue)")


    }
}

