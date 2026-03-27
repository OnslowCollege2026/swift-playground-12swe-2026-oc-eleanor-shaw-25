// The Swift Programming Language
// https://docs.swift.org/swift-book




@main
struct SwiftPlayground {
    static func main() {







//Constants and Variables

//Each inner array contains the english word, then the correct answer, and then 3 incorrect answers
let vocabulary : [[String]] = [
    ["Hello", "Hola","Ola", "Halo", "Holla"],
    ["Goodbye", "Adiós", "Adios", "Hola", "Si"],
    ["Thank you", "Gracias", "Manzana", "De nada", "Quiero"],
    ["Yes", "Sí", "Si", "No", "Ni"],
    ["You're welcome", "De nada", "Gracias", "Arriba", "Caja"]
]

//Number of questions that the user got right.
var count = 0

//Indices of the question that the user got wrong
var incorrectIndies: [Int] = []

// The number of questions that the user got wrong first time round
var incorrectCount = 0 

//



//Loop until all of the vocabulary questiions have been asked.
while count < vocabulary.count {
for vocab in vocabulary {
    
    var random:[Int] = [0,0,0,0]
    random[0] = Int.random(in: 1...4)
    random[1] = Int.random(in: 1...4)
    while random[1] == random[0] {
        random[1] = Int.random(in: 1...4)
    }
    random[2] = Int.random(in: 1...4)
    while random[2] == random[1] || random[2] == random[0] {
        random[2] = Int.random(in: 1...4)
    }
    random[3] = Int.random(in: 1...4)
    while random[3] == random[1] || random[3] == random[0] || random[3] == random[2] {
        random[3] = Int.random(in: 1...4)
    }


var correctAnswer = 0
for number in random {
    if number == 1 {
        correctAnswer = number
    }
}
print(correctAnswer)
    print("""
    What is the spanish word for \(vocab[0])?
    The options are: \(vocab[random[0]]), \(vocab[random[1]]), \(vocab[random[2]]), \(vocab[random[3]]))
    """)

if let input = readLine(), let answer:Int = Int(input) {


    if answer == random[correctAnswer] {
        print("YES CORRECT")
    } else {
        print("NO")
        incorrectCount += 1
        incorrectIndies.append(count)
    }
    
} else {
    print("Invalid answer")
}
count += 1

}

print(incorrectIndies)

// Show the question.

//Present the possible answers

//Check if the user guessed the correct answer.

//If not, make a note of the question to ask again later. 

    }
}

}