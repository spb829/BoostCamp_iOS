//
//  ViewController.swift
//  CircularActionMenu
//
//  Created by 임성훈 on 2017. 7. 19..
//  Copyright © 2017년 임성훈. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var giraffButton: UIButton!
    @IBOutlet weak var arrowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       initButton()
    }
    
    private func initButton() -> Void {
        arrowButton.isHidden = true
        rabbitButton.isHidden = true
        giraffButton.isHidden = true
        
//        let tappingMenu = UIPanGestureRecognizer(target: self, action: #selector(showMenus))
        menuButton.addTarget(self, action: #selector(showMenus), for: .touchDown)
        menuButton.addTarget(self, action: #selector(hideMenus), for: .touchUpInside)
//        menuButton.addTarget(self, action: #selector(hideMenus), for: .touchDragExit)
//        menuButton.addTarget(self, action: #selector(hideAllMenu), for: .touchUpOutside)
        
//        menuButton.addTarget(self, action: #selector(findMenus), for: .touchDragInside)
//        menuButton.addTarget(self, action: #selector(findMenus), for: .touchDragEnter)
        
        let panMenu = UIPanGestureRecognizer(target: self, action: #selector(findLocation))
        menuButton.addGestureRecognizer(panMenu)
        
//        menuButton.addTarget(self, action: #selector(findLocation(_:)), for: .touchDragOutside)
        
//        menuButton.addTarget(self, action: #selector(hideMenus), for: .touchDragExit)
//        let tapMenu = UITapGestureRecognizer(target: self, action: #selector(showMenus))
//        menuButton.addGestureRecognizer(tapMenu)
    }
    
    public func showMenus() -> Void {
        arrowButton.isHidden = false
        rabbitButton.isHidden = false
        giraffButton.isHidden = false
    }
    
    public func hideMenus() -> Void {
        arrowButton.isHidden = true
        rabbitButton.isHidden = true
        giraffButton.isHidden = true
    }
    
    public func hideAllMenu(_ sender: Any) -> Void {
        print("hide")
        arrowButton.isHidden = true
        rabbitButton.isHidden = true
        giraffButton.isHidden = true
    }
    
    @IBAction func touchOutside(_ sender: Any) {
        arrowButton.isHidden = true
        rabbitButton.isHidden = true
        giraffButton.isHidden = true
    }
    
    
    public func findLocation(recognizer: UIPanGestureRecognizer) {
        let location = recognizer.location(in: self.view)

        
        if isInRange(postion: location, button: giraffButton) {
            giraffButton.isHighlighted = true
            arrowButton.isHighlighted = false
            rabbitButton.isHighlighted = false
        } else if isInRange(postion: location, button: arrowButton) {
            giraffButton.isHighlighted = false
            arrowButton.isHighlighted = true
            rabbitButton.isHighlighted = false
        } else if isInRange(postion: location, button: rabbitButton) {
            giraffButton.isHighlighted = false
            arrowButton.isHighlighted = false
            rabbitButton.isHighlighted = true
        } else {
            giraffButton.isHighlighted = false
            arrowButton.isHighlighted = false
            rabbitButton.isHighlighted = false
        }

    }
    
    public func isInRange(postion: CGPoint, button: UIButton) -> Bool {
        if postion.x > button.layer.position.x - (button.frame.width/2) && postion.x < button.layer.position.x + (button.frame.width/2) && postion.y > button.layer.position.y - (button.frame.height/2) && postion.y < button.layer.position.y + (button.frame.height/2) {
            return true
        } else {
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

