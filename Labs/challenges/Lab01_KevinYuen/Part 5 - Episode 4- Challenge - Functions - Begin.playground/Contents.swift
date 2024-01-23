//: ## Episode 04: Challenge - Functions

/*:
## Challenge 1
 1. Write a function named `printFullName` that takes two strings called `firstName` and `lastName`.  The function should print out the full name defined as `firstName` + " " + `lastName`. Use it to print out your own full name.
 2. Change the declaration of `printFullName` to have no argument label for either parameter.
*/
func printFullName(_ firstName: String, _ lastName: String){
    print(firstName + " " + lastName)
}

//printFullName(firstName: "Kevin", lastName: "Yuen")


//If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter.
printFullName("Kevin", "Yuen")
/*:
## Challenge 2
 Write a function named `calculateFullName` that returns the full name as a string. Use it to store your own full name in a constant.
*/
func calculateFullName(_ firstName: String, _ lastName: String) -> String{
        return firstName + " " + lastName
}

calculateFullName("Kevin", "Yuen")


