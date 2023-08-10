//
//  ViewController.swift
//  quizzler
//
//  Created by Farid Hamzayev on 20.07.23.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var progressBar: UIProgressView!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  
  var quizStore = QuizStore()

  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }

  @IBAction func answerBtnPressed(_ sender: UIButton) {
    let isCorrectAnswer = quizStore.checkAnswer(sender.currentTitle!)
    
    if isCorrectAnswer {
      sender.backgroundColor = UIColor.green
    } else {
      sender.backgroundColor = UIColor.red
    }
    
    quizStore.nextQuestion()
    updateUI()
  }
  
  func updateUI() {
    questionLabel.text = quizStore.getQuestionText()
    scoreLabel.text = "Score: \(quizStore.getScore())"
    progressBar.setProgress(quizStore.getProgress(), animated: true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
      self.trueButton.backgroundColor = UIColor.clear
      self.falseButton.backgroundColor = UIColor.clear
    }
  }
  
}
