//
//  ButtonBuilder.swift
//  ButtonBuilder
//
//  Created by Fernando Prayogo on 23/04/24.
//

import Foundation
import AsyncDisplayKit

public enum ButtonState {
    case error
    case disabled
    case active
}

public enum ButtonTheme {
    case light
    case dark
}

public enum TextSize {
    case tiny
    case small
    case large
}

final public class ButtonBuilder: ASButtonNode {
    
    public var onTapButton: (() -> Void)?
    
    private var title: String = "" {
        didSet {
            setButtonText()
        }
    }
    
    private var state: ButtonState = .active {
        didSet {
            setUserInteraction()
        }
    }
    
    private var theme: ButtonTheme = .dark {
        didSet {
            setBackgroundColor()
            setButtonText()
            setBorderColor()
        }
    }
    
    private var textSize: TextSize = .large {
        didSet {
            setButtonText()
        }
    }
    
    private var fontSize: CGFloat = 16
    
    private let blackColor: UIColor = hexStringToUIColor(hex: "121212")
    private let whiteColor: UIColor = hexStringToUIColor(hex: "FFFFFF")
    
    public override init() {
        super.init()
        
        cornerRadius = 4
        style.preferredSize = CGSize(width: 96.0, height: 32.0)
    }
    
    public override func didLoad() {
        super.didLoad()
        addGestureRecognizer()
    }
    
    @discardableResult
    public func setTitle(title: String) -> ButtonBuilder {
        self.title = title
        return self
    }
    
    private func setButtonText() {
        let attributedString = NSAttributedString(string: title, attributes: [
            .foregroundColor: theme == .dark ? UIColor.white : UIColor.black
        ])
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
    @discardableResult
    public func setState(state: ButtonState) -> ButtonBuilder {
        self.state = state
        return self
    }
    
    @discardableResult
    public func setTextSize(textSize: TextSize) -> ButtonBuilder {
        self.textSize = textSize
        return self
    }
    
    @discardableResult
    public func setTheme(theme: ButtonTheme) -> ButtonBuilder {
        self.theme = theme
        return self
    }
    
    private func addGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func handleTap() {
        self.onTapButton?()
    }
    
    private func setFontSize() {
        switch textSize {
        case .tiny:
            fontSize = 10
        case .small:
            fontSize = 12
        case .large:
            fontSize = 16
        }
    }
    
    private func setBackgroundColor() {
        switch theme {
        case .dark:
            backgroundColor = hexStringToUIColor(hex: "121212")
        case .light:
            backgroundColor = hexStringToUIColor(hex: "FFFFFF")
        }
    }
    
    private func setUserInteraction() {
        self.isUserInteractionEnabled = state != .disabled
    }
    
    private func setBorderColor() {
        self.borderColor = self.theme == .light ? blackColor.cgColor : nil
        self.borderWidth = self.theme == .light ? 1 : 0
    }
}
