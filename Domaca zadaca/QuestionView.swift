//
//  QuestionView.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 07/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import UIKit

class QuestionView: UIView {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var poklon: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    var correctAnswer: Int!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    @IBAction func press_question1(_ sender: Any) {
        if(correctAnswer==0){
            answer1.backgroundColor = UIColor.green
        }
        else{
            answer1.backgroundColor = UIColor.red
            highlightCorrect()
        }
    }
    
    @IBAction func press_question2(_ sender: Any) {
        if(correctAnswer==1){
            answer2.backgroundColor = UIColor.green
        }
        else{
            answer2.backgroundColor = UIColor.red
            highlightCorrect()
        }
    }
    
    @IBAction func press_question3(_ sender: Any) {
        if(correctAnswer==2){
            answer3.backgroundColor = UIColor.green
        }
        else{
            answer3.backgroundColor = UIColor.red
            highlightCorrect()
        }
    }
    
    @IBAction func press_question4(_ sender: Any) {
        if(correctAnswer==3){
            answer4.backgroundColor = UIColor.green
        }
        else{
            answer4.backgroundColor = UIColor.red
            highlightCorrect()
        }
    }
    
    func highlightCorrect(){
        if(correctAnswer==0){
            press_question1((Any).self)
        }
        else if(correctAnswer==1){
            press_question2((Any).self)
        }
        else if(correctAnswer==2){
            press_question3((Any).self)
        }
        else{
            press_question4((Any).self)
        }
    }
    

    
}
