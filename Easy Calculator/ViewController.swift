//
//  ViewController.swift
//  Easy Calculator
//
//  Created by Min Hu on 2023/9/10.
//

import UIKit
import AVFAudio

class ViewController: UIViewController {

    @IBOutlet weak var firstDialogueLabel: UILabel!
    
    @IBOutlet weak var voiceSwitch: UISwitch!
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var secondNumberTextField: UITextField!
    
    @IBOutlet weak var errorPlaceLabel: UILabel!
    
    @IBOutlet weak var secondDialogueLabel: UILabel!
    // 創建一個 AVSpeechSynthesizer 實例，用於文字轉語音合成
    let synthesizer = AVSpeechSynthesizer()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // 加減乘除按鈕預設無選擇
        segmentedControl.selectedSegmentIndex = -1
        // 對話框預設無文字
        firstDialogueLabel.text = ""
        secondDialogueLabel.text = ""
        // 數字框預設無數字
        firstNumberTextField.text = ""
        secondNumberTextField.text = ""
        // 語音預設開
        voiceSwitch.isOn = true
        // 報錯框預設無文字
        errorPlaceLabel.text = ""
    
    }
    // 點擊 Calculate! 執行的 function：
    @IBAction func calculate(_ sender: UIButton) {
        // 如果第一個數字文字框或第二個數字文字框沒有文字
        if firstNumberTextField.hasText == false || secondNumberTextField.hasText == false{
            // 則報錯
            errorPlaceLabel.text = "Please enter the number"
            // 如果segmentedControl 還沒被選擇過
        } else if segmentedControl.selectedSegmentIndex == -1 {
            // 則報錯
            errorPlaceLabel.text = "Please select an operation"
            // 如果都選了，則開始運算：
        } else{
            // 宣告兩個整數，取自數字文字框的文字內容
            let number1 = Int(firstNumberTextField.text!)
            let number2 = Int(secondNumberTextField.text!)
            // 如果兩個數字都不是 nil
            if number1 != nil && number2 != nil{
                // 如果選擇 plus
                if segmentedControl.selectedSegmentIndex == 0{
                    // 則答案等於兩數相加
                    let answer = number1! + number2!
                    // 第一句對白
                    firstDialogueLabel.text = "What is \(number1!) plus \(number2!) equal to?"
                    // 第二句對白
                    secondDialogueLabel.text = "It‘s a no-brainer! \n\(number1!) plus \(number2!) equal to \(answer)"
                    if voiceSwitch.isOn == true {
                        speak(dialogue1: "What is \(number1!) plus \(number2!) equal to?")
                        speak(dialogue2: "It‘s a no-brainer! \n\(number1!) plus \(number2!) equal to \(answer)")
                    }
                }
                // 如果選擇 minus
                if segmentedControl.selectedSegmentIndex == 1{
                    // 則答案等於兩數相減
                    let answer = number1! - number2!
                    // 第一句對白
                    firstDialogueLabel.text = "What is \(number1!) minus \(number2!) equal to?"
                    // 第二句對白
                    secondDialogueLabel.text = "So easy! \n\(number1!) minus \(number2!) equal to \(answer)"
                    if voiceSwitch.isOn == true {
                        speak(dialogue1: "What is \(number1!) minus \(number2!) equal to?")
                        speak(dialogue2: "So easy! \n\(number1!) minus \(number2!) equal to \(answer)")
                    }
                }
                // 如果選擇 times
                if segmentedControl.selectedSegmentIndex == 2{
                    // 則答案等於兩數相乘
                    let answer = number1! * number2!
                    // 第一句對白
                    firstDialogueLabel.text = "What is \(number1!) times \(number2!) equal to?"
                    // 第二句對白
                    secondDialogueLabel.text = "It‘s a piece of cake!\n\(number1!) times \(number2!) equal to \(answer)"
                    if voiceSwitch.isOn == true {
                        speak(dialogue1: "What is \(number1!) times \(number2!) equal to?")
                        speak(dialogue2: "It‘s a piece of cake!\n\(number1!) times \(number2!) equal to \(answer)")
                    }
                }
                // 如果選擇 divided by
                if segmentedControl.selectedSegmentIndex == 3{
                    // 則答案等於兩數相除
                    let answer = number1! / number2!
                    // 第一句對白
                    firstDialogueLabel.text = "What is \(number1!) divided by \(number2!) equal to?"
                    // 第二句對白
                    secondDialogueLabel.text = "It‘s as easy as pie!\n\(number1!) divided by \(number2!) equal to \(answer)"
                    if voiceSwitch.isOn == true {
                        speak(dialogue1: "What is \(number1!) divided by \(number2!) equal to?")
                        speak(dialogue2: "It‘s as easy as pie!\n\(number1!) divided by \(number2!) equal to \(answer)")
                    }
                }
            }
                
            
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        viewDidLoad()
    }
    // 對白 1 的聲音內容
    func speak(dialogue1:String){
        
        // 使用 dialogue1 為語音內容
        let utterance = AVSpeechUtterance(string: dialogue1)
        // 音高為 1.5
        utterance.pitchMultiplier = 1.5
        // 使用 Ralph 的聲音
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.speech.synthesis.voice.Ralph")
        // 發出聲音
        synthesizer.speak(utterance)
    }
    // 對白 2 的聲音內容
    func speak(dialogue2:String){
        // 使用 dialogue2 為語音內容
        let utterance = AVSpeechUtterance(string: dialogue2)
        // 音高為 1.5
        utterance.pitchMultiplier = 1.5
        // 說話速度為 0.45
        utterance.rate = 0.45
        // 使用 Samantha 的聲音
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.voice.compact.en-US.Samantha")
        // 發出聲音
        synthesizer.speak(utterance)
    }
    
  

}

