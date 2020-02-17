// Build and Run
// swift build
// .build/debug/swift-tour

// https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html

// 0. A Swift Tour
print("Hello, world!")


// 1. Simple Values
//== Variable
// Use 'let' to make a constant and 'var' to make a variable.
var myVariable = 42
myVariable = 50
let myConstant = 42
// myConstant = 50 // ==> error: cannot assign to value: 'myConstant' is a 'let' constant

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble : Double = 70
let explicitFloat: Float = 70

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
//== For
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

// to provide a default value using the ?? operator.
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
//print(informalGreeting)
//Hi John Appleseed

//== switch-case
let vegatable = "red pepper"
switch vegatable {
case "celery":
    print("Add some raisins and make ants on a log")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything states good in soup.")
}
//Is it a spicy red pepper?

//== for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
//print(largest)
//25

//== while
var n = 2
while n < 100 {
    n *= 2
}
//print(n)
//128

var m = 2
repeat {
    m *= 2
} while m < 100
//print(m)
//128

//a range of indexes
var total = 0
for i in 0..<4 {
    total += i
}
//print(total)
//6

var total2 = 0
for i in 0...4 {
    total2 += i
}
//print(total2)
//10


// 3. Functions and Closures
func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
var g1 = greet(person: "Bob", day: "Tuesday")
//print(g1)
//Hello Bob, today is Tuesday.

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
var g2 = greet("John", on: "Wednesday")
//print(g2)
//Hello John, today is Wednesday.

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
//print(statistics.sum)
//120
//print(statistics.2)
//120










