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

//amount of kumara

    print("How many kgs of kumara are being sold?")
    guard let input = readLine(), let sellAmount = Double(input), sellAmount > 0, sellAmount <= currentStock else {
        print("Invalid input. Please enter a number greater than 0 but smaller than the kumara stock.")
        return [0,0]
    }

//bags


    print("How many bags are being sold?")
    guard let input = readLine(), let bagAmount = Int(input) else {
        return [0,0]
    }
let minimumBags = sellAmount / 5
let newBagAmount = Double(bagAmount)
if newBagAmount < minimumBags {
    print("Invalid input. Each bag can only hold 5kg of kumara. You need more bags.")
    return [0,0]
}

//price
let totalKumaraPrice = sellAmount * 3
let totalBagPrice = newBagAmount * 0.2 
let totalPrice = totalKumaraPrice + totalBagPrice

print("""
The cost of the kumara is $\(totalKumaraPrice)
The cost of the bag(s) is $\(totalBagPrice)
The total cost is $\(totalPrice)
""")
    return [sellAmount, newBagAmount, totalPrice]
}

func showSummaryInformation(s salesHistory: [[Double]]) {

//average weight sold per bag

//total amount of kumara
var totalKumaraSold = 0.0
for row in salesHistory {
    totalKumaraSold += row[0]
}
var totalBagSold = 0.0
for row in salesHistory {
    totalBagSold += row[1]
}
var totalMoneyMade = 0.0 
for row in salesHistory {
    totalMoneyMade += row[2]
}

let averageBagWeight = totalKumaraSold / totalBagSold 
let averageMoneyMade = totalMoneyMade / totalBagSold

print("""
Summary Information:

Total kumara sold: \(totalKumaraSold)
Total bags sold: \(totalBagSold)
Money made: \(totalMoneyMade)

Average weight per bag: \(averageBagWeight)
Average amount earned per bag: \(averageMoneyMade)
""")
}

func viewPreviousSales(s salesHistory: [[Double]]) {

print("Previous sales:")

var customerNumber = 0
    for row in salesHistory {
        let kumaraSold = row[0]
        let bagsSold = row[1]
        let moneyMade = row[2]
        customerNumber += 1
        print("Customer #\(customerNumber), brought \(kumaraSold)kg of kumara, \(bagsSold) bags and spent \(moneyMade).")
    }
}



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
    print("You have \(kumaraStock)kgs of kumara in stock.")

} else if menuChoice == 3 {
    let sale = recordSale(s: kumaraStock)
    if sale == [0,0] {

    } else {
    salesHistory.append(sale)
    kumaraStock -= salesHistory[salesHistory.count - 1][0]
    }
    print(salesHistory)

} else if menuChoice == 4 {
showSummaryInformation(s: salesHistory)

} else if menuChoice == 5 {
    viewPreviousSales(s: salesHistory)

} else if menuChoice == 6 {
    print("end program")
    programRunning = false

}





}





    }
}

