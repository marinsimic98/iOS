//
//  Question.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 05/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import Foundation

class Question{
    let id: String?
    let question: String?
    let answers: [String]?
    let correctAnswer: Int?
    
    init?(dic: [String : Any]){
            let id = dic["id"] as? String
            let question = dic["question"] as? String
            let answers = dic["answers"] as? [String]
            let correctAnswer = dic["correct_answer"] as? Int
    
            self.id = id
            self.question = question
            self.answers = answers
            self.correctAnswer = correctAnswer
    
    }
}
