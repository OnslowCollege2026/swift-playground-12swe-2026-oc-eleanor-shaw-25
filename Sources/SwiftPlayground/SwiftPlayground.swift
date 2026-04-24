// The Swift Programming Language
// https://docs.swift.org/swift-book

func callMenu() -> Int {

print("""

KUMARA STALL MENU

1. Add stock
2. View stock
3. Record Sale
4. Show summary infomation
5. View previous sales
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

func recordSale(s currentStock: Double) -> [Double] {
    print("How many kgs of kumara are being sold?")
    guard let input = readLine(), let sellAmount = Double(input), sellAmount > 0, sellAmount <= currentStock else {
        print("Invalid input. Please enter a number greater than 0 but smaller than the kumara stock.")
        return [0,0]
    }


    print("How many bags are being sold?")
    guard let input = readLine(), let bagAmount = Int(input) else {
        return [0,0]
    }
let minimumBags = sellAmount / 5
let newBagAmount = Double(bagAmount)
    print(minimumBags)
if newBagAmount < minimumBags {
    print("Invalid input. Each bag can only hold 5kg of kumara. You need more bags.")
    return [0,0]
}
    return [sellAmount, newBagAmount]
}

//func showSummaryInformation(s salesHistory: [[Double]]) {






@main
struct SwiftPlayground {
    static func main() {


var programRunning = true
var kumaraStock = 0.0
//var previousSales = []
//50kg max kumara 5,000 bags

var salesHistory:[[Double]] = [
]


while programRunning == true{

let menuChoice = callMenu()

if menuChoice == 1 {
kumaraStock = addStock(s: kumaraStock)

} else if menuChoice == 2 {
    print("You have \(kumaraStock)kgs of kumara in stock")

} else if menuChoice == 3 {
    let sale = recordSale(s: kumaraStock)
    if sale == [0,0] {

    } else {
    salesHistory.append(sale)
    print(salesHistory)
    kumaraStock -= salesHistory[salesHistory.count - 1][0]
    }

} else if menuChoice == 4 {
  //  showSummaryInformation(s: salesHistory)

} else if menuChoice == 5 {
    print("view previous sales")

} else if menuChoice == 6 {
    print("end program")
    programRunning = false

}





}





    }
}

