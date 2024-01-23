//: ## Episode 08: Challenge - Optionals

/*:
 ## Challenge 1
 
 You've been provided with a constant below, `hasAllergies`, which has been set to `true`.
 
 Below that, declare a Optional String variable named `dogName`.
 
 On the next line, use a ternary conditional operator to set the value of `dogName` to `nil` if `hasAllergies` is `true`, and to `"Mango"` otherwise.
 */
let hasAllergies = true

var dogName: String?

print(dogName = hasAllergies ? nil : "Mango")

/*:
 ## Challenge 2
 
 Create a constant called `parsedInt` and set it to `Int("10")`. Swift will attempt to parse the string `10` and convert it to an `Int`.
 
 Place your mouse over the constant name and use **Option-Click** to check the type of `parsedInt`. Why is `parsedInt` an optional here?
 */
let parsedInt = Int("10")

//T his is because the conversion from a String to an Int may fail if
// the string does not represent a valid integer. The optional allows
// Swift to handle the possibility of the conversion failing, and it
// will be nil if the string cannot be converted to an integer.


/*:
 ## Challenge 3
 
 Create another constant named `newParsedInt` and set it equal to `Int("cat")`.
 
 What will the value of `newParsedInt be? Why?
 
 */
let newParsedInt = Int("cat")

print(newParsedInt)

// Conversion failing, and it will be nil if the string cannot be converted to an integer.
