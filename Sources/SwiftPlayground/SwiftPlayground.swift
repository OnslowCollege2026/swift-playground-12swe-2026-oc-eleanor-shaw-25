// The Swift Programming Language
// https://docs.swift.org/swift-book

func callMenu() -> Int {

print("""

KUMARA STALL MENU

1. Add stock
2. View stock
3. View previous sales
4. Show summary infomation
5. Record Sale
6. End program

Please enter number:
""")


guard let input = readLine(), let menuChoice:Int = Int(input), menuChoice > 0, menuChoice < 7 else {
    print("Invalid input. Please enter a number between 1-6.")
    return 0
}
return menuChoice
}


func addStock(s currentStock:Double) -> Double {

    print("How many kg of kumara do you want to add to the stock?")
guard let input = readLine(), let addAmount = Double(input), addAmount > 0 else {
        print("Invalid input. Please enter a number greater than 0.")
        return currentStock
    }
    let newStock = currentStock + addAmount
    if newStock > 50 {
        print("Invalid input. The kumara stall cannot excced 50kg of kumara.")
        return currentStock
    }
    return newStock
}



@main
struct SwiftPlayground {
    static func main() {


var programRunning = true
var kumaraStock = 0.0
//var previousSales = []
//50kg max kumara 5,000 bags




while programRunning == true{

let menuChoice = callMenu()

if menuChoice == 1 {
kumaraStock = addStock(s: kumaraStock)
print(kumaraStock)
} else if menuChoice == 2 {
    print("view stock")
} else if menuChoice == 3 {
    print("view previous sales")
} else if menuChoice == 4 {
    print("show summary infomation")
} else if menuChoice == 5 {
    print("record sale")
} else if menuChoice == 6 {
    print("end program")
    programRunning = false
}





}





    }
}

