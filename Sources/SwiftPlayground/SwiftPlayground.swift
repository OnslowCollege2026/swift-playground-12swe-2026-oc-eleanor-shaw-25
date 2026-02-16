// The Swift Programming Language
// https://docs.swift.org/swift-book

//TASK A
func roomVolume() -> Double {
    return 6 * 4 * 5
}

//TASK B
func printArea(l length: Double, w width: Double) {
    let area = length * width
    print(area)
}

//TASK C
func area(l length: Double, w width: Double) -> Double {
    let roomArea = length * width
    return roomArea 
}

//TASK D
func volume(l length: Double, w width: Double, h height: Double) -> Double {
    let volume = length * width * height 
    return volume
}

//task a part 2


 
///Calculates room area 
///-Parameters:
///    - Length of room in meters 
///    - Width of room in meter
///-Returns room area 
///
func roomArea(length: Double, width: Double) -> Double {
    return length * width
}


///Calculates room volume 
///- Parameters:
///    - Length of room in meters
///    - Width of room in meters
///    - Height of room in meters
///- Returns room volume

func roomVolume(length: Double, width: Double, height: Double) -> Double {
    return length * width * height
}


///Checks if room is under 60 meters squared
///- Parameters:
///    - Volume of room in meters squared
///- Returns True if the room is below 60 m³.
///
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}


///Reduces height of room
///- Parameters 
///    - Orginal room height in meters
///    - Reduction percentage - how much the height is to be reduced by
///- Returns new room height that has been reduced
///*/

func reducedHeight(original: Double, reductionPercent: Double) -> Double {
    let multiplier = (100.0 - reductionPercent) / 100.0
    return original * multiplier
}

@main
struct SwiftPlayground {
    static func main() {

//task A
print(roomVolume(),"m³")

//task b
printArea(l: 6.0, w: 2.0)

//task c
let roomArea = area(l: 6.0, w: 3.0)
print(roomArea, "m²")

//task d

print(volume(l: 7.0, w: 1.0, h: 2.0))

    }
}

