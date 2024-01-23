//: ## Episode 04: Challenge - Dictionaries

/*:
 
 ## Challenge 1
 
 Create a dictionary as a variable, and initialize it with the following keys:
 
 - `name`
 - `profession`
 - `country`
 - `city`
 
 As part of the initialization, assign each of those keys a value that corresponds to your own personal information.
 
 */
var personalInfo: [String : String] = ["name": "Kevin", "profession": "Student", "country": "Canada", "city" : "Milton"]


let name = personalInfo["name"]
let profession = personalInfo["profession"]
let country = personalInfo["country"]
let city = personalInfo["city"]

// Printing the dictionary
print("Name: \(name ?? "N/A")")
print("Profession: \(profession ?? "N/A")")
print("Country: \(country ?? "N/A")")
print("City: \(city ?? "N/A")")
/*:
 
 ## Challenge 2
 
 Let's say you decide to move to Cleveland, Ohio, USA. (If you already live in Cleveland, pick somewhere else you'd like to move to!) Update the dictionary as follows:
 
 - Modify `country` to `USA`
 - Modify `city` to `Cleveland`
 - Add a `state` key to the dictionary and assign it the value `Ohio`
 
 */
personalInfo["country"] = "USA"
personalInfo["city"] = "Cleveland"
personalInfo["state"] = "Ohio"

// Accessing values in the dictionary
let state = personalInfo["state"]

// Printing the updated dictionary
print("Name: \(name ?? "N/A")")
print("Profession: \(profession ?? "N/A")")
print("Country: \(country ?? "N/A")")
print("City: \(city ?? "N/A")")
print("State: \(state ?? "N/A")")
/*:
 
 ## Challenge 3
 
 You've decided that Cleveland (or wherever you've moved to) isn't right for you, so instead you plan to be a digital nomad, with no fixed city or state, but stay inside the USA.
 
 - Remove the `city` key-value pair with whatever strategy you like.
 - Remove the `state` key-value pair with a different strategy.
 
 */
personalInfo.removeValue(forKey: "city")
personalInfo.removeValue(forKey: "state")

// Accessing values in the dictionary (Updated)
let stateUp = personalInfo["state"]
let cityUp = personalInfo["city"]

// Printing the updated dictionary
print("Name: \(name ?? "N/A")")
print("Profession: \(profession ?? "N/A")")
print("Country: \(country ?? "N/A")")
print("City: \(cityUp ?? "N/A")")
print("State: \(stateUp ?? "N/A")")
/*:
 
 ## Challenge 4
 
 Iterate over the remaining keys and values in the dictionary and print them out.
 
 */
print("Keys: Values")

// Iterating over keys and values
for (key, value) in personalInfo {
    print("\(key): \(value)")
}



