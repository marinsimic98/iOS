//
//  All_Questions.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 06/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import Foundation

class All_Questions{
    let listOfQuestions: [Question]
    
    init(questions: [[String : Any]]) {
        var list: [Question] = []
        for question in questions{
            list.append(Question(dic: question)!)
        }
        listOfQuestions = list
    }
}
