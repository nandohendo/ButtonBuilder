//
//  ViewController.swift
//  ButtonBuilderDemo
//
//  Created by Fernando Prayogo on 24/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let demoViewController = DemoViewController()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.present(demoViewController, animated: true)
        }
    }

}
