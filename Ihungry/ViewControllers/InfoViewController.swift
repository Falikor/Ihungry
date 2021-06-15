//
//  InfoViewController.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 13.06.2021.
//

import UIKit

class InfoViewController: UIViewController {
    @IBOutlet weak var imagFasting: UIImageView!
    @IBOutlet weak var textFasting: UITextView!
    @IBOutlet weak var questionButton: UIButton!
    
    let questions = Question.getQuestions()
    override func viewDidLoad() {
        super.viewDidLoad()
        questionButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changedFasting(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            imagFasting.image = UIImage(named: "lotus")
            textFasting.text = TypeOfFasting.hour24.description
        case 1:
            imagFasting.image = UIImage(named: "head")
            textFasting.text = TypeOfFasting.hour12.description
        case 2:
            imagFasting.image = UIImage(named: "extended")
            textFasting.text = TypeOfFasting.hour8.description
        case 3:
            imagFasting.image = UIImage(named: "boat")
            textFasting.text = TypeOfFasting.hour6.description
        default:
            print("mistake")
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

extension InfoViewController {
    override func  prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navigationVC = segue.destination as? UINavigationController,
              let vc = navigationVC.topViewController as? QuestionViewController
              else { return }
        vc.questions = questions
    }
}
