//
//  Quiz.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 05/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import Foundation

class Quiz{
    let id: String?
    let title: String?
    let description: String?
    //let image: String
    let level: String?
    let category: Category?
    let listOfQuestions: [Question]
    let image: String
    
    // failable konstruktor koji prima json
    init?(dic: [String: Any]) {
        
        // ovdje znamo da je ovaj json zapravo dictionary pa ga castamo u [String: Any]
        let id = dic["id"] as? String
        let title = dic["title"] as? String
        let description = dic["description"] as? String
        let level = dic["level"] as? String
        let category = dic["category"] as? String
        let questions = (dic["questions"] as? [[String: Any]])!
        let allQuestions = All_Questions(questions: questions)
        let image = "https://www.duluthnewstribune.com/sites/default/files/styles/16x9_860/public/fieldimages/1/0906/2000px-sportballs.svg.png?itok=2hWMVAjq"
        
        self.id = id
        self.title = title
        self.description = description
        //self.image = image!
        self.level = level
        if(category == "SPORTS"){
            self.category = Category.sport
        }
        else{
            self.category = Category.science
        }
        self.listOfQuestions = allQuestions.listOfQuestions
        self.image = image
        
    

        }
    }

