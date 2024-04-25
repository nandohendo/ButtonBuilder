//
//  DemoNode.swift
//  ButtonBuilderDemo
//
//  Created by Fernando Prayogo on 24/04/24.
//

import Foundation
import AsyncDisplayKit
import ButtonBuilderDemo

final class DemoNode: ASDisplayNode {
    
    var onNeedToShowAlert: (() -> Void)?
    
    let darkThemedButton: ButtonBuilder = ButtonBuilder()
        .setTheme(theme: .dark)
        .setState(state: .active)
        .setTitle(title: "SUBMIT")
        .setTextSize(textSize: .large)
    
    override init() {
        super.init()
        
        backgroundColor = .white
        automaticallyManagesSubnodes = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.darkThemedButton.setTheme(theme: .light)
        }
        
        darkThemedButton.onTapButton = { [weak self] in
            self?.onNeedToShowAlert?()
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        
        return ASCenterLayoutSpec(horizontalPosition: .center, verticalPosition: .center, sizingOption: [], child: darkThemedButton)
    }
}
