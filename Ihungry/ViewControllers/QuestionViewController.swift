//
//  QuestionViewController.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 13.06.2021.
//

import UIKit
import AVFoundation

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: [UILabel]!
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    var questions: [Question] = []
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    var AudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "YouChose", ofType: "mp3")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
        
    }

}


extension QuestionViewController {
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        guard let cuerrentIndex = singleButtons.firstIndex(of: sender) else { return }
        let currentAnswer = currentAnswers[cuerrentIndex]
        answersChosen.append(currentAnswer)
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        for (switcher, answer) in zip(multipleSwitches, currentAnswers) {
            if switcher.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    
}
extension QuestionViewController {
    private func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let answers = currentQuestion.answers
        
        switch currentQuestion.type {
        case .single:
            updateSinglStackView(answers: answers)
        case .multiple:
            updateMultipleStackView(answers: answers)
        case .ranged:
            updateRsngedStackView(answers: answers)
        }
    }
    
    private func updateSinglStackView(answers: [Answer]) {
        singleStackView.isHidden = false
        for (button, answer) in zip(singleButtons, answers) {
            button.setTitle(answer.text, for: .normal)
        }
    }
    private func updateMultipleStackView(answers: [Answer]) {
        multipleStackView.isHidden = false
        for (lable, answer) in zip(multipleLabels, answers) {
            lable.text = answer.text
        }
    }
    private func updateRsngedStackView(answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
        
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "resultSegue", sender: nil)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "resultSegue",
        let navigationVC = segue.destination as? UITabBarController,
        let vc = navigationVC.viewControllers?.first as? HomeViewController
        else { return }
        vc.answers = answersChosen
        AudioPlayer.stop()
        
    }
}

