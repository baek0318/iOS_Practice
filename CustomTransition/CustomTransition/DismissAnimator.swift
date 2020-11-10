//
//  DismissAnimator.swift
//  CustomTransition
//
//  Created by 백승화 on 2020/11/06.
//

import UIKit

final class DismissAnimator : NSObject, UIViewControllerAnimatedTransitioning {
    
    static let duration: TimeInterval = 1.25
    
    private let secondViewController : SecondViewController
    private let firstViewController : ViewController
    private let backColor = UIColor(cgColor: CGColor(red: 0.45, green: 0.65, blue: 0.90, alpha: 1.0))
    
    init?(firstViewController : ViewController,secondViewController : SecondViewController) {
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let fromView = transitionContext.view(forKey: .from) else {return}
        
        let newView : UIView = {
            let view = UIView()
            view.backgroundColor = backColor
            view.frame = secondViewController.mainView!.frame
            view.layer.masksToBounds = true
            view.layer.cornerRadius = 20
            return view
        }()
        
        let underView = secondViewController.underView
        
        containerView.addSubview(newView)
        self.firstViewController.mainView?.alpha = 0
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            
            newView.frame = self.firstViewController.mainView!.frame
            underView?.transform = CGAffineTransform(translationX: 0, y: 900)
            fromView.alpha = 0
            
        } completion: { (_) in
            self.firstViewController.mainView?.alpha = 1
            print("dismiss")
            transitionContext.completeTransition(true)
        }
    }
    
}
