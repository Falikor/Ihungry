//
//  ViewController.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 09.06.2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeImag: UIImageView!
    
    @IBOutlet weak var tameCount: UILabel!
    
    @IBOutlet weak var typeFasting: UIPickerView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var timer: Timer?
    var durationTime = 28800
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)


        // Do any additional setup after loading the view.
    }
    @objc func startButtonTapped() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }

    @IBAction func countdown(_ sender: UIButton) {
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
