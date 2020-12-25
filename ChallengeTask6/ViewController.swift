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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 1
        slider.maximumValue = 100000
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let sliderValue = String.localizedStringWithFormat("%d", Int(slider.value))
        if label.text == sliderValue {
            presentAlert(message: "あたり\nあなたの値は\(sliderValue)です")
        } else {
            presentAlert(message: "ハズレ\nあなたの値は\(sliderValue)です")
        }
    }
    
    private func presentAlert(message: String) {
        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler: {(UIAlertAction) in
                                        let num = Int.random(in: 1...100000)
                                        self.label.text = String.localizedStringWithFormat("%d", num)}))
        present(alert, animated: true, completion: nil)
    }
    
}
