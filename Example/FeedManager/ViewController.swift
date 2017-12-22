//
//  ViewController.swift
//  FeedManager
//
//  Created by baharirdan on 12/22/2017.
//  Copyright (c) 2017 baharirdan. All rights reserved.
//

import UIKit
import FeedManager

class ViewController: UIViewController {
    
    var isBlinking = false
    let blinkingLabel = BlinkingLabel(frame: CGRect(x: 10, y: 20, width: 200, height: 30))
    let food1:Food = Food(type:"s",name:"s",color:"s")
    let food2:Food = Food(type:"p",name:"p",color:"p")
    let food3:Food = Food(type:"k",name:"k",color:"k")

    var foods:[Food] = [food1,food2,food3]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup the BlinkingLabel
        blinkingLabel.text = "I blink!"
        blinkingLabel.font = UIFont.systemFont(ofSize: 20)
        view.addSubview(blinkingLabel)
        blinkingLabel.startBlinking()
        isBlinking = true
        
        // Create a UIButton to toggle the blinking
        let toggleButton = UIButton(frame: CGRect(x:10, y:60, width:125, height:30))
        toggleButton.setTitle("Toggle Blinking", for: .normal)
        toggleButton.setTitleColor(UIColor.red, for: .normal)
        toggleButton.addTarget(self, action: #selector(self.toggleBlinking), for: .touchUpInside)
        view.addSubview(toggleButton)
        
        
        getFood(fromService:FoodService)
    }
    
    func getFood<S: Gettable>(fromService service:S) where S.T == [Food] {
        service.get() { [weak self] result in
            switch result {
            case .Success(let food) :
                self.foods = food
            case .Failure(let error) :
                print(error)
            }
        }
    }
    
    @objc func toggleBlinking() {
        if (isBlinking) {
            blinkingLabel.stopBlinking()
        } else {
            blinkingLabel.startBlinking()
        }
        isBlinking = !isBlinking
    }
    
}
