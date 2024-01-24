var greeting = "Hello, playground"
print(greeting)

//Implicit typing
var firstName = "Mark"
print(firstName)

//Explicit typing
var lastName: String = "Meritt"
print(lastName)

print("Hi my name is " + firstName + " " + lastName)
print("Hi my name is \(firstName) \(lastName)")

//Function
func printGreeting() {
    print("Hello World")
}

printGreeting()

func printGreeting(name: String) {
    print(name)
}

printGreeting(name: "Mark")

func printGreeting(_ name: String, _ year: Int) {
    print("My name is \(name) and the year is \(year)")
}

printGreeting("Mark", 2024)

//Tuple
let tuple = (2024, "Mark", true)
print(tuple.0)

//If statement
if 2 > 1 {
    print("this is true")
}

if 1 > 2 {
    print("this is false")
}

//Switch statement
var age = 2
switch age {
case 0...10:
    print("Between 0 to 10")
case 10...30:
    print("Between 10 to 30")
case 30...50:
    print("Between 30 to 50")
case 50...70:
    print("Between 50 to 70")
case 70...100:
    print("Between 70 to 100")
default:
    break
}

//Array
let arr: [Int] = [4, 5, 20, 25, 30]
for i in arr {
    print(i)
}

let arr2: [String] = ["Mark", "Meritt", "PROG", "31632"]
for str in arr2 {
    print(str)
}

let arr3 = [2,4,5,6,10]
for j in arr3 {
    print(j)
}

//While
/*
while age > 0 && age < 101 {
    print("Age is greater than 0 and less than 101")
}

repeat {
    print("Age")
} while age > 0
*/

//Sets - Only the unique elements
var favouriteGenres: Set = ["Rock", "HipHop", "RnB", "RnB"]
for i in favouriteGenres {
    print(i)
}

//Dictionary
var namesAndScores: Dictionary = ["Anna": nil, "Mark": 40, "Brian": 60]
for n in namesAndScores {
    print(n)
}

print(namesAndScores.keys)
print(namesAndScores.values)
print(namesAndScores["Mark"]!)
