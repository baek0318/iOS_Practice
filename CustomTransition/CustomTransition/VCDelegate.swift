//
//  VCDelegate.swift
//  CustomTransition
//
//  Created by 백승화 on 2020/11/05.
//

import UIKit

extension ViewController : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("run")
        guard let firstVC = presenting as? ViewController, let secondVC = presented as? SecondViewController else {return nil}
        
        animator = Animator(firstViewController: firstVC, secondViewController: secondVC)
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        print("run dismiss")
        guard let dismissVC = dismissed as? SecondViewController else {return nil}
    
        dismissAnimator = DismissAnimator(firstViewController: self, secondViewController: dismissVC)
        
        return dismissAnimator
    }
}
