//
//  ViewController.swift
//  CardViewAnimation
//
//  Created by 백승화 on 2020/11/09.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSecondVC()
    }
    
    func addSecondVC() {
        
        guard let secondVC = self.storyboard?.instantiateViewController(identifier: "Second") as? SecondViewController else {return }
        
        self.addChild(secondVC)
        self.view.addSubview(secondVC.view)
        secondVC.didMove(toParent: self)
        
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        secondVC.view.frame = CGRect(x: 0, y: height-250, width: width, height: 250)
    }
}
