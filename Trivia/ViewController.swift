//
//  ViewController.swift
//  Trivia
//
//  Created by Mayerling Bentolila on 25/6/25.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctAnswer: String
}

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    
let questions: [Question] = [
    Question(text: "Who has the most Ballon dOr?", answers: ["Messi", "Pele", "Kaka", "Ronaldo"], correctAnswer: "Messi"),
    Question(text: "Who has won the most World Cups?", answers: ["Klose", "Pele", "Ronaldinho", "Neymar"], correctAnswer: "Pele"),
    Question(text: "Who has the most Champions League?", answers: ["Messi", "Casillas", "Modric", "Ronaldo"], correctAnswer: "Modric")
    
]

var currentQuestionIndex = 0
var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
        // Do any additional setup after loading the view.
    }
    
    func displayQuestion(){
        let current = questions[currentQuestionIndex]
        questionLabel.text = "Question \(currentQuestionIndex + 1)/\(questions.count)"
        questionText.text = current.text
        answerButton1.setTitle(current.answers[0], for: .normal)
        answerButton2.setTitle(current.answers[1], for: .normal)
        answerButton3.setTitle(current.answers[2], for: .normal)
        answerButton4.setTitle(current.answers[3], for: .normal)
    }

    func goToNextQestion(){
        currentQuestionIndex += 1
        if currentQuestionIndex < questions.count{
            displayQuestion()
        } else {
            questionLabel.isHidden = true
            questionText.text = "Quiz Completed!\nYour score: \(score)/\(questions.count)"
            answerButton1.isHidden = true
            answerButton2.isHidden = true
            answerButton3.isHidden = true
            answerButton4.isHidden = true
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func answerTapped(_ sender: UIButton){
        let currentQuestion = questions[currentQuestionIndex]
        let selectedAnswer = sender.currentTitle
        
        if selectedAnswer == currentQuestion.correctAnswer {
            score += 1
        }
        goToNextQestion()
    }

}
