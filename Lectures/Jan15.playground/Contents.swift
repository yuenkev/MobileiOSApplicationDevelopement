import UIKit

var greeting: String? = "Hello welcome to PROG 31632"
print(greeting) //Can still be accessed when nil IF OPTIONAL

//Class
class Person{
    
    //Properties
    var name: String
    var date: String
    var city: String
    var country: String
    
    //Optionals
    var occupation: String?
    var sinNumber: String?
    
    init(name: String, date: String, city: String, country: String, occupation: String? = nil, sinNumber: String? = nil) {
        self.name = name
        self.date = date
        self.city = city
        self.country = country
        self.occupation = occupation
        self.sinNumber = sinNumber
        
        print(self.name, self.date, self.city, self.country, self.occupation,self.sinNumber)
    }
}

var person = Person(name: "Kevin", date: "15/01/24", city: "Mississauga", country: "Canada", occupation: "Student", sinNumber: "123456789")

//Inheritence
class Student: Person {

    var grades: [Int]? //student will have an array of grades

    //Computed property - is a property that is initialized at runtime, its computed
    var tuition: Int {
        return 50000 * grades![0]
    }

    override init(name: String, date: String, city: String, country: String, occupation: String? = nil, sinNumber: String? = nil) {
        super.init(name: name, date: date, city: city, country: country, occupation: occupation, sinNumber: sinNumber)

        self.grades = [100, 100, 100, 98, 95]
    }

    init(name: String, date: String, city: String, country: String, occupation: String?, sinNumber: String?, grades: [Int]?) {

        super.init(name: name, date: date, city: city, country: country, occupation: occupation, sinNumber: sinNumber)

        self.grades = grades
    }

        func printGrades() {
            grades?.forEach({ grade in print(grade)
            })
        }
    }

    var student = Student(name: "Danielle", date: "Jan 15th 2024", city: "Toronto", country: "Canada")
    student.printGrades()

    var student1 = Student(name: "Yunpeng", date: "Jan 15th 2024", city: "Toronto", country: "Canada", occupation: "Student", sinNumber: "310310031")
    student1.printGrades()

    var student2 = Student(name: "Farzan", date: "Jan 15th 2024", city: "Toronto", country: "Canada", occupation: "Student", sinNumber: "219193109310", grades: [100, 100, 100, 100, 100])
    student2.printGrades()
    print(student2.tuition)


class YoungerStudent: Student {
    
    var under18 = true
    
    override init(name: String, date: String, city: String, country: String, occupation: String? = nil, sinNumber: String? = nil) {
        super.init(name: name, date: date, city: city, country: country)
        
        if under18{
            print("This student is under 18")
        } else {
            print("The student is not under 18")
        }
    }
    
    override init(name: String, date: String, city: String, country: String, occupation: String? = nil, sinNumber: String? = nil, grades: [Int]?) {
        super.init(name: name, date: date, city: city, country: country, occupation: occupation, sinNumber: sinNumber, grades: grades)
        
        isUnder18()
    }
    
    override func printGrades(){
        super.printGrades()
        print("This is now the younger student")
    }
    
    override var tuition: Int {
        super.tuition
        return 1000000 * grades![0]
    }
    
    func isUnder18(){
        if under18{
            print("This student is under 18")
        } else {
            print("The student is not under 18")
        }
    }
    
    final func printAge(){
        //method cannot be overriden, its final
        print("This method cannot be overriden")
    }
    
}

var youngerStudent = YoungerStudent(name: "Dylan", date: "Jan 15th 2024", city: "Toronto", country: "Canada", occupation: "Student", sinNumber: "1234567", grades: [100,100,100,100,100])
youngerStudent.printGrades()
print(youngerStudent.tuition)
youngerStudent.printAge()


struct PersonStruct {
    var name: String?
    var city: String?
    
}

var personStruct = PersonStruct(name: "Mark", city: "Boston")



protocol Vehicle {
    func accelerate()
    func stop()
}

class Car: Vehicle {
    func accelerate() {
        print("Accelerate")
    }
    func stop() {
        print("Stop")
    }
}

var car = Car()
car.accelerate()
car.stop()

enum TextAlignment {
    case Left
    case Right
    case Center
}

var textAlign: TextAlignment = .Center

switch textAlign {
    case .Left:
        print("left")
        break
    case .Right:
        print("right")
        break
    case .Center:
        print("Center")
        break
}
