//
//  ViewController.swift
//  StackView_Practice
//
//  Created by 백승화 on 2020/08/05.
//  Copyright © 2020 백승화. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView : UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setStackView()
    }
    
    func setStackView() {
        self.stackView = UIStackView()
        self.stackView.axis = .vertical
        self.stackView.alignment = .fill
        self.stackView.distribution = .fill
        self.stackView.spacing = 8
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.view.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
        self.view.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor).isActive = true
        
        let label = UILabel()
        label.text = "Ocean"
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ocean")
        imageView.setContentHuggingPriority(UILayoutPriority(249), for: .vertical)
        imageView.setContentCompressionResistancePriority(UILayoutPriority(749), for: .vertical)
        
        let button = UIButton()
        button.setTitle("사진 바꾸기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        self.stackView.addArrangedSubview(label)
        self.stackView.addArrangedSubview(imageView)
        self.stackView.addArrangedSubview(button)
    }
    

}

