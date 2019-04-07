//
//  Service.swift
//  Domaca zadaca
//
//  Created by Marin Šimić on 05/04/2019.
//  Copyright © 2019 Marin Šimić. All rights reserved.
//


import UIKit


class Service{
    func fetchData(urlString: String, completion: @escaping ((All_Quizzes?) -> Void)) {
        print("uslo u fetch data" + urlString)
        if let url = URL(string: urlString) {
            print("uslo u let od url")
            var request = URLRequest(url: url)
            request.addValue("225b3ddf80msha350534f81c8c4cp1c0858jsn2a5d1107aad8", forHTTPHeaderField: "X-RapidAPI-Key")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print("uslo u konstrukciju")
                        let quizzes = All_Quizzes(json: json)
                        completion(quizzes)
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            print("izaslo")
            completion(nil)
        }
}
    
    
    func fetchImage(urlString: String, completion: @escaping ((UIImage?) -> Void)){
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            print("creating data task")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("fetched image")
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                    print("completion called")
                } else {
                    completion(nil)
                }
            }
            print("resuming data task")
            dataTask.resume()
        } else {
            completion(nil)
        }
    }

}
