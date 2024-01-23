//: ## Episode 03: Challenge - Tuples


/*:
 ### TUPLES
 
 Declare a constant tuple named specialDate that contains three Int values followed by a String. Use this to represent a date (month, day, year) followed by a word you might associate with that day.
 */
let specialDate = (01, 20, 2024, "Saturday")
/*:
 Create another tuple, but this time name the constituent components. Give them names related to the data that they contain: month, day, year and description.
 */
let specialDate2 : (month : Int, day : Int, year : Int, description: String) = (01, 20, 2024, "Saturday")

/*:
 In one line, read the day and description values into two constants. You’ll need to use the underscore to ignore the month and year.
 */
let (_, day, _, description) = specialDate2
/*:
 Up until now, you’ve only seen constant tuples. But you can create variable tuples, too. Create one more tuple, like in the exercises above, but this time use var instead of let. Now change the day to a new value. */
var specialDate3 = (01, 10, 2024, "Saturday")
