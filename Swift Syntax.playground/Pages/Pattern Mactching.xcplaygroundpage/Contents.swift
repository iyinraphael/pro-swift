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
