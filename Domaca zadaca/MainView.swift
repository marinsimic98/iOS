//
//  MainView.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 05/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//

import UIKit

class MainView: UIViewController {
    
    
    @IBOutlet weak var labelFunFact: UILabel!
    @IBOutlet weak var titleQuiz: UILabel!
    @IBOutlet weak var imageQuiz: UIImageView!
    @IBOutlet weak var errorMessage: UILabel!
    @IBOutlet weak var customView: UIView!
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick(sender: Any) {
        print("click performed")
        let service = Service()
        service.fetchData( urlString: "https://iosquiz.herokuapp.com/api/quizzes") {
            (allQuizzes) in
            if let allQuizzes = allQuizzes {
                let quiz = (allQuizzes.allQuizzes)[0]
                DispatchQueue.main.async {
                    self.errorMessage.isHidden = true
                    self.titleQuiz.text = quiz.title
                    self.titleQuiz.isHidden = false
                    var count: Int = 0
                    for quiz in allQuizzes.allQuizzes{
                        let add = quiz.listOfQuestions.map({$0.question!}).filter{(x: String) -> Bool in (x.contains("NBA"))}.count
                        count += add
                    }
                    self.labelFunFact.text = "Number of questions with words NBA in them: " + String(count)
                    self.labelFunFact.isHidden = false
                    if(quiz.category == Category.sport){
                        self.titleQuiz.backgroundColor = UIColor.green
                        self.imageQuiz.backgroundColor = UIColor.green
                    }
                    else{
                        self.titleQuiz.backgroundColor = UIColor.red
                        self.imageQuiz.backgroundColor = UIColor.red
                    }
                    if let questionView = Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)?.first as? QuestionView {
                        self.customView.addSubview(questionView)
                        questionView.correctAnswer = quiz.listOfQuestions[1].correctAnswer!
                        questionView.label.text = quiz.listOfQuestions[1].question
                        questionView.answer1.setTitle(quiz.listOfQuestions[1].answers?[0], for: .normal)
                        questionView.answer2.setTitle(quiz.listOfQuestions[1].answers?[1], for: .normal)
                        questionView.answer3.setTitle(quiz.listOfQuestions[1].answers?[2], for: .normal)
                        questionView.answer4.setTitle(quiz.listOfQuestions[1].answers?[3], for: .normal)
                    }
                    self.customView.center.x = self.view.center.x
                
                }
                let image = quiz.image
                service.fetchImage(urlString: image){
                    (image) in
                    if let image = image {
                        DispatchQueue.main.async {
                        self.imageQuiz.image = image
                        self.imageQuiz.isHidden = false
                        }
                    }
                }
            
            }
            else{
                DispatchQueue.main.async {
                    self.errorMessage.isHidden = false
                }
            }
        }
    }
    
    
}
    

