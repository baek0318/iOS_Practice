//
//  SecondViewController.swift
//  CardViewAnimation
//
//  Created by 백승화 on 2020/11/09.
//

import UIKit

class SecondViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0.5
        addTapGesture()
    }

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!

    @IBAction func back(_ sender: Any) {
        dismiss(animated: true)
    }
    
    func addTapGesture() {
        let tap : UIPanGestureRecognizer = {
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleTapGesture(recognizer:)))
            return gesture
        }()
        
        self.mainView.addGestureRecognizer(tap)
    }
    
    @objc func handleTapGesture(recognizer : UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let y = self.view.frame.origin.y
        
        self.view.frame = CGRect(x: 0, y: y+translation.y, width: view.frame.width, height: UIScreen.main.bounds.height)
        recognizer.setTranslation(CGPoint.zero, in: self.view)
    }
}
