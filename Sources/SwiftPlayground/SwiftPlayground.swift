// The Swift Programming Language
// https://docs.swift.org/swift-book



/// Shows menu and asks user what option they want from the menu. 
///
/// Parameters:
/// - minimumMenuChoice: the minimum number the user can choose from the menu. 
/// - maximumMenuChoice: the maximum number the user can choose from the menu. 
/// - invalidInput: what the code returns when the input is invalid. 
/// Returns: the users menu choice. 
func callMenu(min minimumMenuChoice: Int, max maximumMenuChoice: Int, i invalidInput: Int) -> Int {

    print("""

KUMARA STALL MENU

1. Add stock
2. View stock
3. Record Sale
4. View summary infomation
5. View previous sales
6. End program

Please enter number:
""")

    //Ensures the input is within expected cases, if not prints error. 
    guard let input = readLine(), let menuChoice:Int = Int(input), menuChoice >= minimumMenuChoice, menuChoice <= maximumMenuChoice else {
        print("Invalid input. Please enter a number between \(minimumMenuChoice)-\(maximumMenuChoice).")
        //Returns to menu. 
        return invalidInput
    }
    //Returns the choice the user picked. 
    return menuChoice
}


/// Asks user how much kumara to be added to stock.   
///
/// Parameters:
/// - currentStock: the current amount of kumara in the stock. 
/// - minimumKumaraAmount: the minimum amount of kumara that can be added to stock. 
/// - maximumStallAmount: the maximum amount of kumara the stall can hold. 
/// - dp: the decimal place the added stock is rounded to.  
/// Returns: the new amount of stock with the desried amount added. 
func addStock(s currentStock:Double, min minimumKumaraAmount: Double, max maximumStallAmount:Double, dp: Double) -> Double {

    print("How many kg of kumara do you want to add to the stock?")
    //Ensures the added amount is within expected amounts if not prints error. 
    guard let input = readLine(), let addAmount = Double(input), addAmount >= minimumKumaraAmount else {
        print("Invalid input. Please enter a number greater than \(minimumKumaraAmount).")
        //Returns to menu. 
        return currentStock
    }
    //Calculates new stock then ensures new stock isn't exceeding the maximum stall amount, if it does prints error. 
    let newStock = currentStock + addAmount
    if newStock > maximumStallAmount {
        print("Invalid input. The kumara stall cannot excced \(maximumStallAmount)kg of kumara.")
        return currentStock
    }

    //Finds out if the amount the user wants to add to stock only is to 1 dp if it isn't prints error. 
    let roundedKumara = (addAmount * dp).rounded() / dp
    if roundedKumara == addAmount {

        //Returns the new stock with the desried amount of kumara added. 
        return newStock

    } else {
        print("Invalid input. Kumara cannot be cut and each kumara weighs 0.1kg. Please enter a number with only 1 decimal place. ")
        return currentStock
    }

    
}



/// Asks user how much kumara to be sold, then prints price.   
///
/// Parameters:
/// - currentStock: the current amount of kumara in the stock. 
/// - minimumKumaraAmount: the minimum amount of kumara that can be sold. 
/// - invalidInput: what the code returns when the input is invalid.
/// - maximumKumaraInBag: the maximum amount of kumara that can fit into a bag. 
/// - kumaraPricePerKg: the price of 1kg of kumara. 
/// - bagPrice:  the price of 1 bag. 
/// - amountOfBags: the amount of bags left in the stall. 
/// - dp: the decimal place the amount of sold kumara and the prices are rounded to. 
/// Returns: an array containing: the amount of kumara sold, the amount of bags sold and the total price of the kumara and bags. 
func recordSale(s currentStock: Double, minKum minimumKumaraAmount:Double, i invalidInput: [Double], maxKumInBag maximumKumaraInBag: Double, kumP kumaraPricePerKg: Double, bagP bagPrice: Double, amountOfBags: Double, dp: Double) -> [Double] {


    //Asks for amount of kumara. 

    print("How many kgs of kumara are being sold?")
    //Ensures the amount of kumara is within expected cases and prints error message if not. 
    guard let input = readLine(), let sellAmount = Double(input), sellAmount >= minimumKumaraAmount, sellAmount <= currentStock else {
        print("Invalid input. Please enter a number greater than \(minimumKumaraAmount) but smaller than the kumara stock.")
        //Returns to menu if input is invalid. 
        return invalidInput
    }

    //Checks sell amount is only to 1dp. Returns to menu if sell amount isn't to 1 dp. 
     let roundedKumara = (sellAmount * dp).rounded() / dp
    if roundedKumara != sellAmount {
        print("Invalid input. Kumara cannot be cut and each kumara weighs 0.1kg. Please enter a number with only 1 decimal place. ")
        return invalidInput
    }



    //Asks for amount of bags. 

    print("How many bags are being sold?")
    //Ensures the amount of bags is within expected cases and prints error message if not. 
    guard let input = readLine(), let bagAmount = Int(input) else {
        print("Invalid input. Please enter a whole postive number.")
        //Returns to menu.
        return invalidInput
    }
    //Calculates minimum amount of bags. 
    let minimumBags = sellAmount / maximumKumaraInBag
    //Changes bag to double for calculations. 
    let newBagAmount = Double(bagAmount)
    //Ensures the customer has enough bags for amount of kumara they are buying and prints error if not. 
    if newBagAmount < minimumBags {
        print("Invalid input. Each bag can only hold \(maximumKumaraInBag)kg of kumara. You need more bags.")
        //Returns to menu. 
        return invalidInput
    }

    //Ensures amount of bags being sold is below the amount of bags the stall has and prints error if not. 
    if newBagAmount > amountOfBags {
        print("Invalid input. There is only \(amountOfBags) bags. Please enter a number below this.")
        //Returns to menu. 
    return invalidInput
    }


    //Calulates and prints price of kumara and bags. 

    let totalKumaraPrice = sellAmount * kumaraPricePerKg
    let totalBagPrice = newBagAmount * bagPrice 
    let totalPrice = totalKumaraPrice + totalBagPrice


    //Rounds prices to 1 dp. 
    let roundedKumaraPrice = (totalKumaraPrice * dp).rounded() / dp
    let roundedPrice = (totalPrice * dp).rounded() / dp

    print("""
    The cost of the kumara is $\(roundedKumaraPrice)
    The cost of the bag(s) is $\(totalBagPrice)
    The total cost is $\(roundedPrice)
    """)

    //Returns the amount of kumara sold, the amount of bags sold and the total price of sale (rounded). 
    return [sellAmount, newBagAmount, roundedPrice]
}


/// Shows the summary information of the sales, this includes: 
/// total amount of kumara sold, total bags sold, total money made,
/// average weight of kumara per bag, average money made per bag.    
///
/// Parameters:
/// - salesHistory: the array containing each customer's: amount 
/// of kumara, number of bags, and price. 
func viewSummaryInformation(s salesHistory: [[Double]]) {


    //Calculates total amount of kumara sold.
    var totalKumaraSold = 0.0
    for row in salesHistory {
        totalKumaraSold += row[0]
    }

    //Calculates total amount of bags sold. 
    var totalBagSold = 0.0
    for row in salesHistory {
        totalBagSold += row[1]
    }

    //Calculates total money made. 
    var totalMoneyMade = 0.0 
    for row in salesHistory {
        totalMoneyMade += row[2]
    }

    //Calculates average bag weight and average amount of money made per bag. 
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


/// Shows previous sales for each customer. For each customer 
/// the information printed is the customer number, amount of 
/// kumara sold, amount of bags sold and money made. 
///
/// Parameters:
/// - salesHistory: the array containing each customer's: amount 
/// of kumara, number of bags, and price. 
func viewPreviousSales(s salesHistory: [[Double]]) {

    print("Previous sales:")

    var customerNumber = 0

    //Repeats for each customer.
    for row in salesHistory {

        //Calculates and prints infomation about the customer. 
        let kumaraSold = row[0]
        let bagsSold = row[1]
        let moneyMade = row[2]
        customerNumber += 1
        print("Customer #\(customerNumber), brought \(kumaraSold)kg of kumara, \(bagsSold) bags and spent \(moneyMade).")
    }
}

import Foundation 

@main
struct SwiftPlayground {
    static func main() {

///Used to repeat code until user wants code to stop. 
var programRunning = true

//Amount of kumara in stock. 
var kumaraStock = 0.0

///All previous sales. Each row is a customer. Column 0: amount of kumara brought, column 1: amount of bags brought, column 2: total price. 
var salesHistory:[[Double]] = []

///Options for different menu choices.
let menuChoiceAddStock = 1
let menuChoiceViewStock = 2
let menuChoiceRecordSale = 3
let menuChoiceViewSummaryInfomation = 4
let menuChoiceViewPreviousSales = 5
let menuChoiceEndProgram = 6

///Minimum and maximum amounts for menu choices
let minimumMenuChoice = 1
let maximumMenuChoice = 6

//Invalid input for menu choice and sell amount. When the user has put in a invalid input the code uses these to show that the input was invalid.  
let invalidMenuChoice = 0
let invalidInput:[Double] = [0,0,0]

///Minimum amount of kumara that can be added or sold from stock. 
let minimumKumaraAmount = 0.1
//Maximum amount of kumara that the stall can hold. 
let maximumStallAmount = 50.0

//The amount of decimal places the kumara and prices are rounded to. 
let decimalPlace = 10.0


let kumaraPricePerKg = 3.0
let bagPrice = 0.2
var amountOfBags = 5000.0
let maximumKumaraInBag = 5.0


//Repeats code until user wants to end program. 
while programRunning == true{

    //Opens menu and gets the option the user wants. 
    let menuChoice = callMenu(min:minimumMenuChoice, max:maximumMenuChoice, i:invalidMenuChoice)

    //Menu choice for add stock. 
    if menuChoice == menuChoiceAddStock {

        kumaraStock = addStock(s: kumaraStock, min: minimumKumaraAmount, max:maximumStallAmount, dp: decimalPlace)


    //Menu choice for view stock.
    } else if menuChoice == menuChoiceViewStock {
        print("You have \(kumaraStock)kgs of kumara in stock.")


    //Menu choice for record sale. 
    } else if menuChoice == menuChoiceRecordSale {

        //Records sale, this includes amount of kumara, amount of bags and total price. 
        let sale = recordSale(s: kumaraStock, minKum: minimumKumaraAmount, i: invalidInput, maxKumInBag: maximumKumaraInBag, kumP: kumaraPricePerKg, bagP: bagPrice, amountOfBags: amountOfBags, dp: decimalPlace)

        //Only adds information to relevant variables if the input is valid.  
        if sale != invalidInput {
            salesHistory.append(sale)
            kumaraStock -= salesHistory[salesHistory.count - 1][0]
            amountOfBags -= salesHistory[salesHistory.count - 1][1]
        } 


    //Menu choice for view summary information
    } else if menuChoice == menuChoiceViewSummaryInfomation {

        //Calculates and prints out total kumara sold, total bags sold, total money made, average weight per bag, average amount of money made per bag. 
        viewSummaryInformation(s: salesHistory)


    //Menu choice for view previous sales.
    } else if menuChoice == menuChoiceViewPreviousSales {

        //Prints each sale. For each customer the information printed is the customer number, amount of kumara sold, amount of bags sold and money made. 
        viewPreviousSales(s: salesHistory)


    //Menu choice for end program. 
    } else if menuChoice == menuChoiceEndProgram {

        print("Thank you for using this program.")
        programRunning = false

    }
}


    }
}

