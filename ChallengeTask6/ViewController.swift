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
    
    /// 答えの範囲は書き散らさずに1箇所で定義
    private let answerRange = (1...100_000)
    
    /// 文字列化せずに答えを保持
    private var answer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 定義された範囲を元に設定
        slider.minimumValue = Float(answerRange.lowerBound)
        slider.maximumValue = Float(answerRange.upperBound)
        
        makeAnswer()
        displayAnswer()
    }
    
    @IBAction func randomButton(_ sender: Any) {
        let sliderValue = Int(slider.value)

        // 1行目のメッセージのみ変えれば良い
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

        // 見やすくインデント整理
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
        // ラベルに表示する際のフォーマットはここにまとめた
        label.text = String.localizedStringWithFormat("%d", answer)
    }
}
