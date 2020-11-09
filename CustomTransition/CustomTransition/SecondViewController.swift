//
//  SecondViewController.swift
//  CustomTransition
//
//  Created by 백승화 on 2020/11/05.
//

import UIKit

class SecondViewController : UIViewController {
    
    var mainView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("call second view")
        mainView = createView()
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    func createView() -> UIView {
        
        let box : UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(cgColor: CGColor(red: 0.45, green: 0.65, blue: 0.90, alpha: 1.0))
            return view
        }()
        
        self.view.addSubview(box)
        
        box.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        box.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.view.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: 0).isActive = true
        self.view.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: 500).isActive = true
        
        return box
    }
}
