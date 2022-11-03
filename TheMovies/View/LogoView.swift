//
//  LogoView.swift
//  TheMovies
//
//  Created by Sergio Maturano on 01/11/2022.
//

import UIKit

class LogoView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addLineDashedStroke(pattern: [2, 2], radius: 0.0, color: UIColor.white.cgColor)
    }
    
    private func addLineDashedStroke(pattern: [NSNumber]?, radius: CGFloat, color: CGColor) {
        let borderLayer = CAShapeLayer()

        borderLayer.strokeColor = color
        borderLayer.lineDashPattern = pattern
        borderLayer.frame = bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radius, height: radius)).cgPath

        layer.addSublayer(borderLayer)
    }

    
}
