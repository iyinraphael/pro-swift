//MARK: - Basic Switch
//Working with one value


let name = "twostraws"

switch name {
case "bilbo":
    print("Hello, Bilbo Baggins")
case "twostraws":
    print("Hello, Paul Hudson")
default:
    print("Authentication failed!")
}

//Working with two or more values
let password = "fr0st1es"

switch (name, password) {
case ("bilbo", "bagg1n5"):
    print("Hello, Bilbo Baggins")
case ("twostraws", "fr0st1es"):
    print("Hello, Paul Hudson")
default:
    print("Who are you?")
}

//Combining two values into a single tuple
//In this instance, both parts of the tupple must match the case in order for it to executed
let authentication = (name: "twostraws", password: "fr0st1es")

switch authentication {
case ("bilbo", "bagg1n5"):
    print("Hello, Bilbo Baggins")
case ("twostraws", "fr0st1es"):
    print("Hello, Paul Hudson")
default:
    print("Who are you?")
}

//When working with tuples, there are some occasions when you want a partial match
let authenticationIP = (name: "jabread", password: "UrbanPlan", ipAddress: "127.0.0.1")

switch authenticationIP {
case ("makin", "Pythonic", _):
    print("Hello, Makin Ajileye")
case ("jabread", "UrbanPlan", "127.0.0.1"):
    print("Hello, iyin Raphael")
default:
    print("Who you be?")
}

//Matchinng with part of tuples and still want to know what the other part is
switch authenticationIP {
case ("jabread", let passcode, "127.0.0.1"):
    print("Hello iyin Raphael, your password is \(passcode)")
default:
    print("Who are you?")
}

//Using calculated tuples to solve FizzBuzz code challenge instead of static tuples
func fizzbuzz(_ number: Int) -> String {
    switch (number % 3 == 0, number % 5 == 0) {
    case (true, false):
        return "Fizz"
    case (false, true):
        return "Buzz"
    case (true, true):
        return "FizzBuzz"
    case (false, false):
        return String(number)
    }
}
print(fizzbuzz(15))



//MARK: - Basic Loops
let iyin = (name: "jabread", password: "UrbanPlan")
let aji = (name: "makin", password: "Pythonic" )
let taylor = (name: "taylor", password: "Pythonic")

let users = [iyin, aji, taylor]

for user in users {
    print(user.name)
}

for case let (theirNames, theirPasscode) in users {
    print("User \(theirNames) has the passowrd \(theirPasscode) urbanPlan")
}

//This filters the users array so that only items with Pythonic
for case let (theName, "Pythonic") in users {
    print("User \(theName) has the password \"Pythonic\" ")
}



//MARK: - Matching optionals
let optionalName: String? = "twostraws"
let optionalPassword: String? = "fr0stles"

switch ( optionalName, optionalPassword) {
case let (.some(optionalN), .some(optionalP)):
    print("Hello, \(optionalN)")
case let (.some(optionN2), .none):
    print("Please enter a password")
default:
    print("who are you?")
}

import Foundation

let data: [Any?] = ["Bill", nil, 69, "Ted"]

for case let .some(datum) in data {
    print(datum)
}

for case let datum? in data {
    print(datum)
}



//MARK: - Matching ranges

let age = 36

switch age {
case 0 ..< 18:
    print("You have the energy and time, but not the money")
case 18 ..< 70:
    print("You have the energy and money, but not the time")
default:
    print("You have the time and money, but not the energy")
}

//using contain method from Struct Range
if (0 ..< 18).contains(age) {
    print("You have the energy and time, but not the money")
} else if (18 ..< 70).contains(age) {
    print("You have the energy and money, but not the time")
} else {
    print("You have the time and money, but not the energy")
}

let ageUser = (name: "jabread", password: "ziggathin", age: 36)

switch ageUser {
case let (name, _, 0 ..< 18):
    print("\(name) has the energy and time, but no moeny")
case let (name, _, 18 ..< 70):
    print("\(name) has the energy and money, but not the time")
case let (name, _, _):
    print("\(name) has the time and money, but no energy")
}



//MARK: - matching enums and associated values

enum Weathertype {
    case Cloudy
    case Sunny
    case Windy
}

let today = Weathertype.Cloudy

switch today {
    
case .Cloudy:
    print("it's cloudy")
case .Windy:
    print("it's windy")
default:
    print("It's sunny")
}

//Using an associated value
//creating an associated type, binding a local constant to it, but also using that binding to filter for specific values.
enum WeatherTypeAscted {
    
    case Cloudy(coverage: Int)
    case Sunny
    case Windy
}
let todayCloudy = WeatherTypeAscted.Cloudy(coverage: 100)

switch todayCloudy {
case .Cloudy(let coverage) where coverage < 100:
    print("it's cloudy with \(coverage)% coverage")
case .Cloudy(let coverage) where coverage == 100:
    print("You must live in the UK")
case .Windy:
    print("It's windy")
default:
    print("it's sunny")
}

//Using associated values and range matching.
switch todayCloudy {
case .Cloudy(let coverage) where coverage == 0:
    print("You must live in the Death Valley")
case .Cloudy(let coverage) where (1...99).contains(coverage):
    print("It's cloudy with \(coverage)% coverage")
case .Cloudy(let coverage) where coverage == 100:
    print("You must live in the UK")
case .Windy:
    print("It's windy")
default:
    print("It's sunny")
}


//MARK: - Matching types
import UIKit

let view: AnyObject = UIButton()

//Swift will take the first matching case it finds, and is returns true if an object is a specific type or one of its parent classes.
switch view {
case is UIButton:
    print("Found a button")
case is UILabel:
    print("Found a label")
case is UISwitch:
    print("Found a switch")
case is UIView:
    print("Found a view")
default:
    print("Found something else")
}

for label in view.subviews where label is UILabel {
    print("Found a label with a frame \(label.frame)")
}


for number in 1...100 where number % 2 == 1 {
    print(number)
}

let celebrities = ["Michael Jackson", "Taylor Swift", "Michael Caine", "Adele Adkins", "Michael Jordan"]

for name in celebrities where !name.hasPrefix("Michael") {
    print(name)
}

for name in celebrities where name.hasPrefix("Michael") && name.count == 13 {
    print(name)
}




//MARK: - Nil Coalescing

let optionalNameT: String? = "Taylor"
let unwrappedName = optionalNameT ?? "Anonymous"

print(unwrappedName)

let nilName: String? = nil
let anonyName = nilName ?? "Anonymous"

let savedText = (try? String(contentsOfFile: "saved.txt")) ?? "Hello, world!"
print(savedText)


//MARK: - Guard. Also guard keeps optiona; unwraps in scope, so variable stays around within the method
func giveAwardTo(name: String) {
    guard name == "Taylor swift"  else {
        print("No way!")
        
        return
    }
    print("Congratulations, \(name) !")
}

giveAwardTo(name: "Taylor Swift")

for i in 1...100 {
    guard i % 8 == 0 else { continue }
    
    print(i)
}

for i in 1...100 where i % 8 == 0 {
    print(i)
}


//MARK: - Lazy loading

class Singer {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func reversedName() -> String {
        return "\(name.uppercased()) backwards is \(String(name.uppercased().reversed()))!"
    }
}

let taylorSinger = Singer(name: "Taylor Swift")
print(taylorSinger.reversedName())

let fibonacciNumbers = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
let evenFibonacci = fibonacciNumbers.filter { $0 % 2 == 0 }

print(evenFibonacci)


class SingerLazy {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    /**     The property is now lazy, which means the code inside the closure will be executed
            only the first time we read the reversedName property.
    **/
    lazy var reversedName: String = {
        return "\(self.name.uppercased()) backwards is \(String(name.uppercased().reversed()))!"
    }()
}

let taylorLazySinger = SingerLazy(name: "Taylor Swift")

print(taylorLazySinger.reversedName)

//MARK: - Lazy functions
class SingerLazyFunc {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    lazy var reversedName: String = getReversedName()
    
    private func getReversedName() -> String {
        return "\(self.name.uppercased()) backwards is \(String(name.uppercased().reversed()))!"
    }
}

let taylorLazyFunc = SingerLazyFunc(name: "Taylor Swift")
print(taylorLazyFunc.reversedName)


//MARK: - Lazy Singletons
class MusicPlayer {
    
    init() {
        print("Ready to play songs!")
    }
}

class SingerMusic {
    
    static let musicPlayer = MusicPlayer()
    
    init() {
        print("Creatig a new singer")
    }
    
}

let singerMusic = SingerMusic()
SingerMusic.musicPlayer

//MARK: - Lazy Sequences
func fibonacci(num: Int) -> Int {
    
    if num < 2 {
        return num
    } else {
        return fibonacci(num: num - 1) + fibonacci(num: num - 2)
    }
}

let fibonacciSequence = (0...20).map(fibonacci)
print(fibonacciSequence[10])

let fibonacciSequence2 = (0...199).lazy.map(fibonacci)
print(fibonacciSequence2, [19])
