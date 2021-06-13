//
//  ViewController.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 09.06.2021.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var homeImag: UIImageView!
    @IBOutlet weak var tameCount: UILabel!
    @IBOutlet weak var typeFasting: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    
    var timer: Timer?
    var durationTime = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        typeFasting.dataSource = self
        typeFasting.delegate = self


        // Do any additional setup after loading the view.
    }
    @objc func startButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        
    }

    @IBAction func countdown(_ sender: UIButton) {
        timerFasting()
        }
    
func timerFasting() {
        startButton.isHidden = true
        durationTime -= 1
        let hour = String(durationTime / 3600)
        let minutes = String((durationTime % 3600) / 60)
        let seconds = String((durationTime % 3600) % 60)
        tameCount.text = hour + ":" + minutes + ":" + seconds
        if durationTime == 0 {
        timer?.invalidate()
    }
}
}

extension HomeViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
}
extension HomeViewController {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch row {
        case 0:
            durationTime = TypeOfFasting.hour6.rawValue
           return TypeOfFasting.hour6.definition
        case 1:
            durationTime = TypeOfFasting.hour8.rawValue
           return TypeOfFasting.hour8.definition
        case 2:
            durationTime = TypeOfFasting.hour12.rawValue
           return TypeOfFasting.hour12.definition
        case 3:
            durationTime = TypeOfFasting.hour24.rawValue
           return TypeOfFasting.hour24.definition
        default:
            print("mistake")
        }
        return ""
    }
}
