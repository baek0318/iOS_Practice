//
//  MemberController.swift
//  Scheduler
//
//  Created by 백승화 on 2020/12/09.
//

import UIKit

class MemberController : UIViewController {
    
    let memberModel = MemberModelImpl()
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var enrollButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func nameEnroll(_ sender: Any) {
        
    }
    
}
