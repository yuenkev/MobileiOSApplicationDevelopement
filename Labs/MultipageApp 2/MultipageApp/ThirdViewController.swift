import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet var mathQuestionLabel: UILabel!
    @IBOutlet var userAnswerTextField: UITextField!

    var correctAnswer: Int = 0

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Generate a random math question every time the view appears
        generateRandomMathQuestion()
    }

    func generateRandomMathQuestion() {
        let number1 = Int.random(in: 1...10)
        let number2 = Int.random(in: 1...10)
        correctAnswer = number1 + number2
        mathQuestionLabel.text = "\(number1) + \(number2) = ?"
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        print(correctAnswer)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFourthViewController",
           
            let vcFour = segue.destination as? FourthViewController {
            
            var isAnswerCorrect: Bool? = false
            
            if let userAnswer = Int(userAnswerTextField.text ?? "") {
                isAnswerCorrect = userAnswer == correctAnswer
            } else {
                isAnswerCorrect = false
            }
            
            let resultMessage = isAnswerCorrect ?? false ? "Correct!" : "Incorrect... The correct answer is \(correctAnswer)"
            vcFour.stringText = "Your answer of \(userAnswerTextField.text ?? "") was \(resultMessage)"
        }
    }
}
