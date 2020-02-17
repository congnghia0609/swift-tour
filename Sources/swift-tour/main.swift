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

var nn:String? = nil //"nghia"
//let mm = nn! + " tran" //=> Fatal error: Unexpectedly found nil while unwrapping an Optional value.
//print(mm)
if nn != nil {
    let mm = nn! + " tran"
    print(mm)
}

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

// Functions can be nested.
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
var rf = returnFifteen()
//print(rf)
//15

// Functions are a first-class type. A function can return another function as its value.
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
var inc = increment(7)
//print(inc)
//8

// A function can take another function as one of its arguments.
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
var chm = hasAnyMatches(list: numbers, condition: lessThanTen)
//print(chm)
//true

// Functions are actually a special case of closures: blocks of code that can be called later.
var maptriple = numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})
//print(maptriple)
//[60, 57, 21, 36]

var mapchan = numbers.map({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    }
    return number
})
//print(mapchan)
//[20, 0, 0, 12]

let mappedNumbers = numbers.map({number in 3*number})
//print(mappedNumbers)
//[60, 57, 21, 36]

let sortedNumbers = numbers.sorted{$0 > $1}
//print(sortedNumbers)
//[20, 19, 12, 7]


// 4. Objects and Classes
//== class
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
//print(shapeDescription)
//A shape with 7 sides.

class NamedShape {
    var numverOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numverOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numverOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
var area = test.area()
//print(area)
//27.040000000000003
var sdesc = test.simpleDescription()
//print(sdesc)
//A square with sides of length 5.2.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numverOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
//print(triangle.perimeter)
//9.3
triangle.perimeter = 9.9
//print(triangle.perimeter)
//9.9
//print(triangle.sideLength)
//3.3000000000000003

// code run before and after setting a new value, use 'willSet' and 'didSet'.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "anothe test shape")
//print(triangleAndSquare.square.sideLength)
//10.0
//print(triangleAndSquare.triangle.sideLength)
//10.0
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
//print(triangleAndSquare.triangle.sideLength)
//50.0

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
// Optional
//print(sideLength)
// Optional force-unwrap
//print(sideLength!)
//2.5


// 5. Enumerations and Structures
//== enum
// By default, Swift assigns the raw values starting at zero and incrementing by one each time.
// 'ace' is explicitly given a raw value of 1, and the rest of the raw values are assigned in order.
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
//print(ace)
//ace
let aceRawValue = ace.rawValue
//print(aceRawValue)
//1
if let convertedRank = Rank(rawValue: 3) {
    let threeDesciption = convertedRank.simpleDescription()
    print(threeDesciption)
    //3
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDesciption = hearts.simpleDescription()
//print(heartsDesciption)

enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out og cheese")
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}
//Sunrise is at 6:00 am and sunset is at 8:09 pm.


//== struct
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//print(threeOfSpadesDescription)
//The 3 of spades


// 6. Protocols and Extensions
//== protocol
// Use protocol to declare a protocol.
protocol ExampleProtocol {
    var simpleDescription: String { get }
    // mutating: to mark a method that modifies the structure.
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105

    //doesn’t need any of its methods marked as 'mutating'
    // because methods on a class can always modify the class.
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
//print(aDescription)
//A very simple class. Now 100% adjusted.

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
//print(bDescription)
//A simple structure (adjusted)


//== extension
//Use extension to add functionality to an existing type,
// such as new methods and computed properties.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}
//print(7.simpleDescription)
//The number 7

let protocolValue: ExampleProtocol = a
//print(protocolValue.simpleDescription)
//A very simple class. Now 100% adjusted.
//print(protocolValue.anotherProperty)
//=> error: value of type 'ExampleProtocol' has no member 'anotherProperty'

















