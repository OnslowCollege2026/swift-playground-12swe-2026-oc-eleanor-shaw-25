// The Swift Programming Language
// https://docs.swift.org/swift-book


func readNumber(prompt: String) -> Double {
    var returnValue = -1.0

    print(prompt)
    guard let input = readLine(), let number = Double(input), number > 0 else {
        print("Invalid number")
        return readNumber(prompt: prompt)
    }
    returnValue = number
    return returnValue
    
}

@main
struct SwiftPlayground {
    static func main() {

        let minimumLength = 0.0
        let minimumWidth = 0.0
        let minimumHeight = 0.0
        let oversizedFuriture = 2.0

        var thing = true

        while thing == true {
            print("What is the length of your room?")

            
            var thing2 = true

            if let input = readLine(), let roomLength = Double(input), roomLength > minimumLength {
                while thing2 == true {
                    thing = false

                    print("What is the width of your room?")

                    if let input = readLine(), let roomWidth = Double(input), roomWidth > minimumWidth {
                        let roomArea = roomWidth * roomLength
                        
                        thing2 = false

                        var thing3 = true
                        while thing3 == true {

                            print("What is the height of your room?")
                            if let input = readLine(), let roomHeight = Double(input), roomHeight > minimumHeight {
                                let roomVolume = roomHeight * roomLength * roomWidth
                                
                                thing3 = false

                                let furnitureVolumes = [1.2, 0.8, 2.5, 0.6, 1.0]


                                for (index, furniture) in furnitureVolumes.enumerated() {
                                    print("Item \(index + 1): \(furniture)")
                                    if furniture > oversizedFuriture {
                                        print("Oversized item detected")
                                    }
                                }
                                let totalFurnitureVolume = furnitureVolumes.reduce(0,+)
                                let usableVolume = roomVolume - totalFurnitureVolume
                                
                                print("\(roomArea)m²")
                                print("\(roomVolume)m³")
                                print("\(totalFurnitureVolume)m³")
                                print("Usable volume: \(usableVolume)m³")

                                if usableVolume > 60.0 {
                                    print("Usable volume is fine.")
                                } else {
                                    print("You don't have enough space boy!")
                                }




                            } else {
                            print("invalid number")
                            }

                        }
                    } else {
                        print("invalid number")
                    }

                }
            } else {
                    print("invalid number")
            }
        }














    }
}

