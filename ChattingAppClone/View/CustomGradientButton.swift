//
//  CustomGradientButton.swift
//  ChattingAppClone
//
//  Created by Emirhan İpek on 4.08.2024.
//

import UIKit

class CustomGradientButton: UIButton {

    @IBInspectable var startColor: UIColor = .black {
        didSet {
            updateGradient()
        }
    }

    @IBInspectable var endColor: UIColor = .blue {
        didSet {
            updateGradient()
        }
    }
    
    private var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }

    private func updateGradient() {
        gradientLayer?.removeFromSuperlayer()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = bounds
        
        layer.insertSublayer(gradientLayer, at: 0)
        
        self.gradientLayer = gradientLayer
        self.gradientLayer?.cornerRadius = 16
    }
}
