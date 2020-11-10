//
//  Animator.swift
//  CustomTransition
//
//  Created by 백승화 on 2020/11/05.
//

import UIKit

final class Animator : NSObject, UIViewControllerAnimatedTransitioning {
    
    static let duration: TimeInterval = 1.25
    
    private let firstViewController : ViewController
    private let secondViewController : SecondViewController
    private let backColor = UIColor(cgColor: CGColor(red: 0.45, green: 0.65, blue: 0.90, alpha: 1.0))
    
    init?(firstViewController : ViewController, secondViewController : SecondViewController) {
        
        self.firstViewController = firstViewController
        self.secondViewController = secondViewController
        
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return Self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let toView = transitionContext.view(forKey: .to) else {return }
        
        guard let original = firstViewController.mainView?.frame else {return}
        
        secondViewController.mainView?.backgroundColor = .clear
        secondViewController.mainView?.layoutIfNeeded()
        guard let secondSize = secondViewController.mainView?.frame.size else {return}
        
        let secondPoint = CGPoint(x: 0, y: 0)
        
        let newView : UIView = {
            let view = UIView()
            view.backgroundColor = backColor
            view.frame = original
            return view
        }()
        
        let underView = secondViewController.underView
        
        containerView.addSubview(toView)
        toView.alpha = 0
        containerView.addSubview(newView)
        containerView.addSubview(underView!)
        
        underView?.transform = CGAffineTransform(translationX: 0, y: 900)
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            newView.frame.size = secondSize
            newView.frame.origin = secondPoint
            underView?.transform = .identity
            toView.alpha = 1
            
        } completion: { (_) in
            newView.alpha = 0
            self.secondViewController.mainView?.backgroundColor = self.backColor
            transitionContext.completeTransition(true)
        }
    }
    
}

