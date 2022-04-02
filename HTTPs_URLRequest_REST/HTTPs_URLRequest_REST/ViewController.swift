//
//  ViewController.swift
//  HTTPs_URLRequest_REST
//
//  Created by Aisha Ali on 4/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiCall(url: "https://jsonplaceholder.typicode.com/posts")
    }
    
    func apiCall(url: String){
        guard let url = URL(string: url) else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String:AnyHashable] = [
            "userId":1,
            "title":"Welcome to Heaven Aisha",
            "body":"This Aisha tring to send HTTPs Request"
        ]
        request.httpBody = try?JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("-----SUCCESS-----\n\(response)")
            } catch{
                print("-----FAILED-----\n\(error)")
            }
        }
        task.resume()
    }
    
    
}

