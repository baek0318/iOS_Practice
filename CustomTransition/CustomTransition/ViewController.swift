//
//  ViewController.swift
//  CustomTransition
//
//  Created by 백승화 on 2020/11/04.
//

import UIKit

class ViewController: UIViewController {
    
    var animator : Animator?
    var dismissAnimator : DismissAnimator?
    var mainView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.transitioningDelegate = self
        self.mainView = createView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.action))
        mainView?.addGestureRecognizer(tap)
    }
    
    @objc func action() {
        print("tap")
        guard let second = storyboard?.instantiateViewController(identifier: "Second") as? SecondViewController else {return }
        second.transitioningDelegate = self
        second.modalPresentationStyle = .custom
        present(second, animated: true)
    }
    
    
    func createView() -> UIView {
        
        let box : UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor(cgColor: CGColor(red: 0.45, green: 0.65, blue: 0.90, alpha: 1.0))
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 20
            return view
        }()
        
        self.view.addSubview(box)
        
        box.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        box.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50).isActive = true
        self.view.trailingAnchor.constraint(equalTo: box.trailingAnchor, constant: 50).isActive = true
        self.view.bottomAnchor.constraint(equalTo: box.bottomAnchor, constant: 250).isActive = true
        
        self.mainView?.layoutIfNeeded()
        return box
    }

}

