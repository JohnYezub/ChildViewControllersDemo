//
//  ViewController.swift
//  ChildViewControllersDemo
//
//  Created by   admin on 31.07.2020.
//  Copyright © 2020 Evgeny Ezub. All rights reserved.
//

import UIKit

protocol TopDelegate {
    func toggle()
}

class TopViewController: UIViewController {

    var delegate: TopDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 60, height: 30))
        button.setTitle("Switch", for: .normal)
        button.backgroundColor = .magenta
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .cyan
    }

    @objc func pressButton() {
        print("press")
        delegate?.toggle()
    }

}

