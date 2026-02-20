// The Swift Programming Language
// https://docs.swift.org/swift-book






/// Shows menu and prompts for an action in the menu
/// - Returns: menu choice the user picked
func menuChoice() -> Int {

        print("""
    ==== Egg Shop ====
    1. Add eggs
    2. Sell eggs
    3. Show current stock
    4. Show total eggs sold
    5. End day
    6. Exit
    Choose an option:
    """)

    guard let input = readLine(), let menuChoice = Int(input), menuChoice > 0, menuChoice < 7 else {
        print("Invalid number")
        return 0
    }
        return menuChoice
}


/// Adds desried amount of eggs to egg stock
/// - Parameters:
///    - currentStock: the current amount of eggs in stock
/// - Returns: the new stock with desried added amount
func addEggs(c currentStock: Int) -> Int {
    print("How many eggs do you want to add?")
    guard let input = readLine(), let addAmount = Int(input), addAmount > 0 else {
        print("Invalid number")
        return currentStock
    }
    let newStock = currentStock + addAmount
    if newStock > 1001 {
        print("Your egg stock cannot exceed 1000 eggs.")
        return currentStock
    }
    return newStock
    
}


/// Subtracts sold amount of eggs from egg stock 
/// - Parameters:
///    - currentStock: the current amount of eggs in stock
/// - Returns: new amount of egg stock with the subtracted amount of sold eggs
func sellEggs(c currentStock: Int) -> Int {
    print("How many egg do you want to sell?")
    guard let input = readLine(), let sellAmount = Int(input), sellAmount > -1, sellAmount < currentStock else {
        print("Invalid number")
        return 0
    }
    return sellAmount
}


/// Ends a day using the egg stock website and prints end message
/// - Parameters:
///   - whichDay: The number of days that has passed
///   - eggInStock: the amount of eggs in the egg stock in the day
///   - eggsSold: the amount of eggs sold in the day
/// - Returns: A new day number as a day has passed
func endDay(wd whichDay:Int, eis eggInStock:Int, es eggsSold:Int) -> Int {
    
    let dayNumber = whichDay + 1
    print("""
    Ending day \(dayNumber)
    Today you added \(eggInStock)
    and sold \(eggsSold) 
    your eggs will be reset tomorrow
    """)
    return dayNumber
}



@main
struct SwiftPlayground {
    static func main() {

///Tells system the user is using the website
var usingShop = true

///Number of eggs in stock
var eggsInStock = 0

///Number of eggs sold
var eggsSold = 0

///Which day it is 
var whichDay = 0

//Repeats until users wants to stop using the website
while usingShop == true {

    //Asks user what they want to do
    let currentMenuChoice = menuChoice()

        //Option user might choose to add eggs.
        if currentMenuChoice == 1 {
            eggsInStock = addEggs(c: eggsInStock)

            //Option user might choose to sell eggs.
        } else if currentMenuChoice == 2 {
            let currentEggsSold = sellEggs(c: eggsInStock)

            //Subtracts sold eggs from egg stock 
            eggsInStock -= currentEggsSold

            //Adds sold eggs to eggs sold
            eggsSold += currentEggsSold

            //Option user might choose to show eggs in egg stock.
        } else if currentMenuChoice == 3 {
            print("You have \(eggsInStock) eggs in your egg stock.")

            //Option user might choose to show eggs sold.
        } else if currentMenuChoice == 4 {
            print("You have sold \(eggsSold) eggs in total.")

            //Option user might choose to end day.
        } else if currentMenuChoice == 5 {

            //Prints end message.
            whichDay = endDay(wd: whichDay, eis: eggsInStock, es: eggsSold)

            //Resets egg stock and amount of eggs sold.
            eggsInStock = 0
            eggsSold = 0

            //Option user might choose to exit program.
        } else if currentMenuChoice == 6 {

            //Prints ending message
            print("Thank you for using this website!")

            //Stops repeating menu
            usingShop = false
        }
}


    }
}

