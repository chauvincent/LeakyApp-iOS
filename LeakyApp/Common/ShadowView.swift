//
//  ShadowView.swift
//  LeakyApp
//
//  Created by Vincent Chau on 2/24/19.
//  Copyright © 2019 Vincent Chau. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    // MARK: - Private Variables

    let radius = 12

    // MARK: - View Life Cycle

    override func layoutSubviews() {
        super.layoutSubviews()
        configureCurvedCorners()
        configureShadows()
    }

    // MARK: - Setup Views

    fileprivate func configureShadows() {
        layer.masksToBounds = false
        layer.cornerRadius = 8.0
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 3.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowColor = UIColor(
            red: 157/255,
            green: 157/255,
            blue: 157/255,
            alpha: 1.0
        ).cgColor
    }

    fileprivate func configureCurvedCorners() {
        let corners: UIRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        ).cgPath
        layer.mask = maskLayer
    }

}
