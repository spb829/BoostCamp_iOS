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
        let thread1 = Thread(target: self, selector: #selector(self.thread1), object: nil)
        
        thread1.start()
        
        let thread2 = Thread(target: self, selector: #selector(self.thread2), object: nil)
        
        thread2.start()
        
        NSURLConnection.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func thread1() -> Void {
        while(true) {
            print(#function)
        }
    }
    
    public func thread2() -> Void {
        while(true) {
            print(#function)
        }
    }
}

