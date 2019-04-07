//
//  All_Quizzes.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 06/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import Foundation

class All_Quizzes{
    let allQuizzes: [Quiz]
    
    init(json: Any) {
        var quizzes: [Quiz] = []
        if let dic = json as? [String: Any]{
            if let list = dic["quizzes"] as? [[String : Any]]{
                for element in list{
                    if let quiz = Quiz(dic: element){
                        quizzes.append(quiz)
                    }
                }
            }
        }
        self.allQuizzes = quizzes
    }

}
