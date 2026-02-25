// The Swift Programming Language
// https://docs.swift.org/swift-book


func printBoard(board: [[String]]) {
    print("+---+---+---+")
    board.forEach { line in
        print("| \(line[0]) | \(line[1]) | \(line[2]) |")
        print("+---+---+---+")
    }

}

func askForMove(board: [[String]]) -> [Int] {
    while true{
        print("Please enter the row number:")
        if let userInput = readLine(), let rowNumber = Int(userInput), rowNumber > 0, rowNumber < 4 {
            let systemRowNumber = rowNumber - 1

            print("Please enter the column number:")
            if let userInput = readLine(), let columnNumber = Int(userInput), columnNumber > 0, columnNumber < 4 {
                let systemColumnNumber = columnNumber - 1
                if board[systemRowNumber][systemColumnNumber] == "." {
                    return [systemRowNumber,systemColumnNumber] 

                } else {
                    print("This spot is already taken please choose another.")
                }
            } else {
                print("Invalid number")
            } 



        } else {
                print("Invalid number")
        } 
    } 

}







func hasWon(b board:[[String]]) {

    if board[0][0] == "x" {

    }
}


@main
struct SwiftPlayground {
    static func main() {

var playerMoves = 0

var board = [
    [".",".","."], //row 0
    [".",".","."], //row 1
    [".",".","."], //row 2
]
printBoard(board: board)

var player = "x"

while playerMoves < 9 {
//Ask for users move
let position = askForMove(board: board)
board[position[0]][position[1]] = player
printBoard(board: board)
playerMoves += 1

if player == "x"{
    player = "o"
} else {
    player = "x"
}

hasWon(b: board)


}
// //First move:0 in the middle.
// board[1][1] = "O"
// printBoard(board: board)

// //Second move : x in top left.
// board[0][0] = "X"
// printBoard(board: board)

// //Third move : o in top-right.
// board[0][2] = "O"
// printBoard(board: board)

// //Fourth move : x in bottom-left.
// board[2][0] = "X"
// printBoard(board: board)

// //Fifth move : o in middle-left.
// board[1][0] = "O"
// printBoard(board: board)

// //Sixth move : x in middle-right.
// board[1][2] = "X"
// printBoard(board: board)

// //Seventh move : o in bottom-middle.
// board[2][1] = "O"
// printBoard(board: board)

// //Eighth move : x in bottom-right.
// board[2][2] = "X"
// printBoard(board: board)


// //Ninth move : o in top-middle.
// board[0][1] = "O"
// printBoard(board: board)


    }
}













