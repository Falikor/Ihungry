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
    @IBOutlet weak var restartButton: UIButton!
    
    private var timer: Timer?
    private var durationTime = 0
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        restartButton.isHidden = true
        typeFasting.dataSource = self
        typeFasting.delegate = self
        
        let letNowYouType = resultTestOfTypeFasting()
        updateUI(myType: letNowYouType)
    }
    
    @objc func startButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }

    @IBAction func countdown(_ sender: UIButton) {
        timerFasting()
        }
    
    @IBAction func restartTimer(_ sender: UIButton) {
        startButton.isHidden = false
        typeFasting.isHidden = false
        timer?.invalidate()
        restartButton.isHidden = true
    }
}
    

extension HomeViewController {
    private func timerFasting() {
            startButton.isHidden = true
            typeFasting.isHidden = true
            restartButton.isHidden = false
            durationTime -= 1
            var hour = String(durationTime / 3600)
            var minutes = String((durationTime % 3600) / 60)
            var seconds = String((durationTime % 3600) % 60)
            hour = vluesSmolTen(number: hour)
            minutes = vluesSmolTen(number: minutes)
            seconds = vluesSmolTen(number: seconds)
            tameCount.text = hour + ":" + minutes + ":" + seconds
            if durationTime == 0 {
            timer?.invalidate()
        }
    }
    
    private func vluesSmolTen(number: String) -> String {
        var newNumber = number
        if (Int(number) ?? 0) < 10 {
            newNumber = String("0" + String(number))
        }
        return newNumber
    }
}

extension HomeViewController {
    internal func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    internal func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
}
extension HomeViewController {
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
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

extension HomeViewController {
    
    private func resultTestOfTypeFasting() -> TypeOfFasting? {
        var frequncyOfType: [TypeOfFasting: Int] = [:]
        let fastingTypes = answers.map {$0.type}
        
        for fastingType in fastingTypes {
            if let fastingTypeCount = frequncyOfType[fastingType] {
                frequncyOfType.updateValue(fastingTypeCount + 1, forKey: fastingType)
            } else {
                frequncyOfType[fastingType] = 1
            }
        }
        let sortedFrequncyOfType = frequncyOfType.sorted {$0.value > $1.value}
        guard let mostFrequencyTypeOfFasting = sortedFrequncyOfType.first?.key else {return nil}
        return mostFrequencyTypeOfFasting
        }
    
    private func updateUI(myType: TypeOfFasting?) {
        if myType == nil {
            tameCount.text = "00:00:00"
        } else {
            tameCount.text = "Вам подходит - \(myType?.definition ?? "")"
            switch myType {
            case .hour24:
                typeFasting.selectRow(3, inComponent: 0, animated: true)
            case .hour12:
                typeFasting.selectRow(2, inComponent: 0, animated: true)
            case .hour8:
                typeFasting.selectRow(1, inComponent: 0, animated: true)
            case .hour6:
                typeFasting.selectRow(0, inComponent: 0, animated: true)
            case .none:
                typeFasting.selectRow(0, inComponent: 0, animated: true)
            }
        }
    }
}
