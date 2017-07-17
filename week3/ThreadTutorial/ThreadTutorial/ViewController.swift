//
//  ViewController.swift
//  ThreadTutorial
//
//  Created by Sohn on 17/07/2017.
//  Copyright © 2017 Sohn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func preload(completionHandler: @escaping ([[String: AnyObject]]?) -> Void) {
        let session: URLSession = {
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForRequest = 5
            configuration.timeoutIntervalForResource = 5
            return URLSession(configuration: configuration, delegate: nil, delegateQueue: nil)
        }()
        
        let url = URL(string: "http://www.naver.com")!
        
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []), let array = json as? [[String: AnyObject]] {
                DispatchQueue.main.async {
                    completionHandler(array)
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(nil)
                }
            }
        }
        task.resume()
    }
}

