// The Swift Programming Language
// https://docs.swift.org/swift-book

func callMenu(min minimumMenuChoice: Int, max maximumMenuChoice: Int, i invalidInput: Int) -> Int {

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


    guard let input = readLine(), let menuChoice:Int = Int(input), menuChoice >= minimumMenuChoice, menuChoice <= maximumMenuChoice else {
        print("Invalid input. Please enter a number between \(minimumMenuChoice)-\(maximumMenuChoice).")
        return invalidInput
    }
    return menuChoice
}


func addStock(s currentStock:Double, min minimumKumaraAmount: Double, max maximumStallAmount:Double) -> Double {

    print("How many kg of kumara do you want to add to the stock?")
    guard let input = readLine(), let addAmount = Double(input), addAmount >= minimumKumaraAmount else {
        print("Invalid input. Please enter a number greater than \(minimumKumaraAmount).")
        return currentStock
    }
    let newStock = currentStock + addAmount
    if newStock > maximumStallAmount {
        print("Invalid input. The kumara stall cannot excced \(maximumStallAmount)kg of kumara.")
        return currentStock
    }

    //Deciamalssss
    

    return newStock
}





func recordSale(s currentStock: Double, minKum minimumKumaraAmount:Double, i invalidInput: [Double], maxKumInBag maximumKumaraInBag: Double, kumP kumaraPricePerKg: Double, bagP bagPrice: Double) -> [Double] {

//amount of kumara

    print("How many kgs of kumara are being sold?")
    guard let input = readLine(), let sellAmount = Double(input), sellAmount >= minimumKumaraAmount, sellAmount <= currentStock else {
        print("Invalid input. Please enter a number greater than \(minimumKumaraAmount) but smaller than the kumara stock.")
        return invalidInput
    }

//bags


    print("How many bags are being sold?")
    guard let input = readLine(), let bagAmount = Int(input) else {
        return invalidInput
    }
    let minimumBags = sellAmount / maximumKumaraInBag
    let newBagAmount = Double(bagAmount)
    if newBagAmount < minimumBags {
        print("Invalid input. Each bag can only hold \(maximumKumaraInBag)kg of kumara. You need more bags.")
        return invalidInput
    }

//price
    let totalKumaraPrice = sellAmount * kumaraPricePerKg
    let totalBagPrice = newBagAmount * bagPrice 
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
var salesHistory:[[Double]] = []

///Constants for different menu choices.

///Menu choice for adding stock.
let menuChoiceAddStock = 1
let menuChoiceViewStock = 2
let menuChoiceRecordSale = 3
let menuChoiceViewSummaryInfomation = 4
let menuChoiceViewPreviousSales = 5
let menuChoiceEndProgram = 6

///Minimum/maximum amounts for things
let minimumMenuChoice = 1
let maximumMenuChoice = 6
let invalidMenuChoice = 0

let minimumKumaraAmount = 0.1
let maximumStallAmount = 50.0

let maximumKumaraInBag = 5.0
let kumaraPricePerKg = 3.0
let bagPrice = 0.2

let invalidInput:[Double] = [0,0]





//Repeats code until user wants to end program. 
while programRunning == true{

    //Opens menu for user to choose from. 
    let menuChoice = callMenu(min:minimumMenuChoice, max:maximumMenuChoice, i:invalidMenuChoice)

    //Menu choice for add stock. 
    if menuChoice == menuChoiceAddStock {
        kumaraStock = addStock(s: kumaraStock, min: minimumKumaraAmount, max:maximumStallAmount)


    //Menu choice for view stock
    } else if menuChoice == menuChoiceViewStock {
        print("You have \(kumaraStock)kgs of kumara in stock.")


    //Menu choice for record sale. 
    } else if menuChoice == menuChoiceRecordSale {
        let sale = recordSale(s: kumaraStock, minKum: minimumKumaraAmount, i: invalidInput, maxKumInBag: maximumKumaraInBag, kumP: kumaraPricePerKg, bagP: bagPrice)
        if sale == invalidInput {

        } else {
            salesHistory.append(sale)
            kumaraStock -= salesHistory[salesHistory.count - 1][0]
        }


    //Menu choice for view summary information
    } else if menuChoice == menuChoiceViewSummaryInfomation {
        showSummaryInformation(s: salesHistory)


    //Menu choice for view previous sales.
    } else if menuChoice == menuChoiceViewPreviousSales {
        viewPreviousSales(s: salesHistory)


    //menu choice for end program. 
    } else if menuChoice == menuChoiceEndProgram {
        print("Thank you for using this program.")
        programRunning = false

    }

}


    }
}

