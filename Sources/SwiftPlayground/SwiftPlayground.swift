// The Swift Programming Language
// https://docs.swift.org/swift-book


/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    for row in board {
    for value in row {
        
        print(value, terminator: " ")
    }
    print()
}


}


/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    var newGuesses = guesses
if row > 6, row < 1, col > 6, guesses[row][col] == "X", guesses[row][col] == "S", guesses[row][col] == "O" {
    print("Invalid number")
    
}
if ocean[row][col] == "S" {
    print("HIT")
    newGuesses[row][col] = "X"
}

if ocean[row][col] == "~" {
    print("MISS")
    newGuesses[row][col] = "O"
}
return newGuesses

}


/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
/// 
/// Returns: How many ships remain unhit.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var numberShip = 0
    var numberShipsHit = 0
    for row in ocean {
        for value in row {
            if value == "S" {
                numberShip += 1
            }
        }
    }
        for row in guesses {
        for value in row {
            if value == "S" {
                numberShipsHit += 1
            }
        }
    }
    let shipRemaining = numberShip - numberShipsHit
    return shipRemaining
}

@main
struct SwiftPlayground {
    static func main() {

let size = 6
var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

guesses = processGuess(row: 1, col: 1, ocean: ocean, guesses: guesses)


printBoard(ocean)

print("You are player 1 ")

for shipNumber in  0..<4 {
    print("Choose the row for ship number \(shipNumber + 1)")
guard let input = readLine(), let shipRow:Int = Int(input), shipRow > 0 else {
    print("Invalid number")
    return
} 
    print("Choose the column for ship number \(shipNumber)")
guard let input = readLine(), let shipCol:Int = Int(input), shipCol > 0 else {
    print("Invalid number")
    return
} 

ocean[shipRow - 1][shipCol - 1] = "S"


}
printBoard(ocean)

printBoard(guesses)

print("You are player 2. What is your row guess?")
guard let input = readLine(), let guessRow:Int = Int(input) else {
    print("Invalid number")
    return
} 

print("You are player 2. What is your column guess?")
guard let input = readLine(), let guessCol:Int = Int(input) else {
    print("Invalid number")
    return
} 
guesses = processGuess(row: guessRow - 1, col: guessCol - 1, ocean: ocean, guesses: guesses)


    }
}

