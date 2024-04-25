//
//  DemoViewController.swift
//  ButtonBuilderDemo
//
//  Created by Fernando Prayogo on 24/04/24.
//

import Foundation
import AsyncDisplayKit

final class DemoViewController: ASDKViewController<ASDisplayNode> {
    
    let demoNode = DemoNode()
    let alert = UIAlertController(title: "Button is tapped!", message: "", preferredStyle: .alert)
    
    override init() {
        super.init(node: demoNode)
        
        demoNode.onNeedToShowAlert = { [weak self] in
            
            guard let self = self else {
                return
            }
            
            self.present(self.alert, animated: true) { [weak self] in
                self?.dismissAlert()
            }
        }
        
    }
    
    private func dismissAlert() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.alert.dismiss(animated: true)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
