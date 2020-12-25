//
//  ViewController.swift
//  ChallengeTask6
//
//  Created by 酒井健太郎 on 2020/12/25.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var label: UILabel!
    
    private let answerRange = (1...100_000)
    
    private var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.minimumValue = Float(answerRange.lowerBound)
        slider.maximumValue = Float(answerRange.upperBound)
        
        makeAnswer()
        displayAnswer()
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let sliderValue = Int(slider.value)
        
        let firstLine: String
        
        if answer == sliderValue {
            firstLine = "あたり"
        } else {
            firstLine = "ハズレ"
        }
        
        presentAlert(message: "\(firstLine)\nあなたの値は\(sliderValue)です")
    }
    
    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "再挑戦",
                style: .default,
                handler: { [weak self] _ in
                    guard let strongSelf = self else { return }
                    strongSelf.makeAnswer()
                    strongSelf.displayAnswer()
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
    }

    private func makeAnswer() {
        answer = Int.random(in: answerRange)
    }
    
    private func displayAnswer() {
        label.text = String.localizedStringWithFormat("%d", answer)
    }
}
