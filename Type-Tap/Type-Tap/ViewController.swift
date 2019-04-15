//
//  ViewController.swift
//  Type-Tap
//
//  Created by Amy An on 4/14/19.
//  Copyright © 2019 Amy An. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var morseLabel: UILabel!
    @IBOutlet weak var morseTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle the text field's user input through delegate callbacks.
        inputTextField.delegate = self
    }
    
    //MARK: Functions
    func charToMorse(char: Character) -> String {
        if(char=="A"||char=="a"){return ".-"}
        if(char=="B"||char=="b"){return "-..."}
        if(char=="C"||char=="c"){return "-.-."}
        if(char=="D"||char=="d"){return "-.."}
        if(char=="E"||char=="e"){return "."}
        if(char=="F"||char=="f"){return "..-."}
        if(char=="G"||char=="g"){return "--."}
        if(char=="H"||char=="h"){return "...."}
        if(char=="I"||char=="i"){return ".."}
        if(char=="J"||char=="j"){return ".---"}
        if(char=="K"||char=="k"){return "-.-"}
        if(char=="L"||char=="l"){return ".-.."}
        if(char=="M"||char=="m"){return "--"}
        if(char=="N"||char=="n"){return "-."}
        if(char=="O"||char=="o"){return "---"}
        if(char=="P"||char=="p"){return ".--."}
        if(char=="Q"||char=="q"){return "--.-"}
        if(char=="R"||char=="r"){return ".-."}
        if(char=="S"||char=="s"){return "..."}
        if(char=="T"||char=="t"){return "-"}
        if(char=="U"||char=="u"){return "..-"}
        if(char=="V"||char=="v"){return "...-"}
        if(char=="W"||char=="w"){return ".--"}
        if(char=="X"||char=="x"){return "-..-"}
        if(char=="Y"||char=="y"){return "-.--"}
        if(char=="Z"||char=="z"){return "--.."}
        if(char=="1"){return ".----"}
        if(char=="2"){return "..---"}
        if(char=="3"){return "...--"}
        if(char=="4"){return "....-"}
        if(char=="5"){return "....."}
        if(char=="6"){return "-...."}
        if(char=="7"){return "--..."}
        if(char=="8"){return "---.."}
        if(char=="9"){return "----."}
        if(char=="0"){return "-----"}
        if(char==" "){return "|"}
        else{
            return "badChar"
        }
    }
    func stringToMorse(myString: String) -> String {
        var morseString = ""
        var startNewWord = false
        for chars in myString {
            let morseChar = charToMorse(char: chars)
            if(morseChar == "badChar"){
                return "Please only enter A-Z, 0-9, or space characters."
            }
            if(startNewWord||morseChar=="|"){
                morseString.append(morseChar)
                if(morseChar=="|"){
                    startNewWord = true
                }
                else{
                    startNewWord = false
                }
            }
            else{
                morseString.append(" "+morseChar)
            }
        }
        return morseString
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        morseLabel.text = stringToMorse(myString: textField.text!)
    }
    
    //MARK: Actions
    @IBAction func morseButton(_ sender: UIButton) {
        if(inputTextField.text != nil){
            morseLabel.text = stringToMorse(myString: inputTextField.text!)
        }
    }
    
}

