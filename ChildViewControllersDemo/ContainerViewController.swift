//
//  ContainerViewController.swift
//  ChildViewControllersDemo
//
//  Created by   admin on 31.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, TopDelegate {
    func toggle() {
        
        if !isMove {
            configureBottom()
        }
        isMove = !isMove
        showBottom(shouldMove: isMove)
        print("container")
    }
    
    var isMove = false
    var topVC: UIViewController!
    var bottomVC: UIViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTop()
        // Do any additional setup after loading the view.
    }

    func configureTop() {
        let top = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! TopViewController
        top.delegate = self
        topVC = top
        addVC(topVC)
    }
    
    func configureBottom() {
        if bottomVC == nil {
            bottomVC = BottomViewController()
        }
            addChild(bottomVC)
            view.insertSubview(bottomVC.view, at: 0)
            bottomVC.didMove(toParent: self)
        
    }
    
    func showBottom(shouldMove: Bool) {
        if shouldMove {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                //self.topVC.view.frame.origin.x  = self.topVC.view.frame.width - 200
                self.topVC.view.frame = CGRect(x: self.topVC.view.frame.width - 200, y: self.topVC.view.frame.origin.y, width: self.topVC.view.frame.width, height: self.topVC.view.frame.height / 2)
            }) { (finished) in
                
            }
        } else {
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                           self.topVC.view.frame.origin.x = 0
                self.topVC.view.frame = CGRect(x: self.topVC.view.frame.origin.x, y: self.topVC.view.frame.origin.y, width: self.topVC.view.frame.width, height: self.topVC.view.frame.height * 2)
                       }) { (finished) in
                        self.bottomVC.removeVC()
                       }
            
            
            
        }
    }
}
extension UIViewController {
    
    func addVC(_ child: UIViewController) {
        addChild(child)
        self.view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func removeVC() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
