// Build and Run
// swift build
// .build/debug/swift-tour

// https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

// 0. A Swift Tour
print("Hello, world!")


// 1. Simple Values
//== Variable
var myVariable = 42
myVariable = 50
let myConstant = 42
// myConstant = 50 // ==> error: cannot assign to value: 'myConstant' is a 'let' constant

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble : Double = 70

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
// print("widthLabel:", widthLabel)
// widthLabel: The width is 94

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
// print(appleSummary)
// I have 3 apples.
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
// print(fruitSummary)
// I have 8 pieces of fruit.

//== Array
var shoppingList = ["catfish", "water", "tulips"]
// print(shoppingList)
// ["catfish", "water", "tulips"]
shoppingList[1] = "bottle of water"
// print(shoppingList)
// ["catfish", "bottle of water", "tulips"]
shoppingList.append("blue paint")
// print(shoppingList)
// ["catfish", "bottle of water", "tulips", "blue paint"]
shoppingList = []
// print(shoppingList)
// []

//== Dictionary
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
// print(occupations)
// ["Malcolm": "Captain", "Kaylee": "Mechanic"]
occupations["Jayne"] = "Public Relations"
// print(occupations)
// ["Malcolm": "Captain", "Kaylee": "Mechanic", "Jayne": "Public Relations"]
occupations = [:]
// print(occupations)
// [:]

let emptyArray = [String]()
let emptyDictionary = [String: Float]()


// 2. Control Flow
let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
// print(teamScore)
// 11

//== optional
var optionalString: String? = "Hello"
// print(optionalString == nil)
// false
// print(optionalString)
// Optional("Hello")
var optionalName: String? = nil //"John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, guest"
}
// print(greeting)
// Hello, guest

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print(informalGreeting)




