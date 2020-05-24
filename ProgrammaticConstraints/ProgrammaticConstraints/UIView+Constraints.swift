//
//  UIView+HybridConstraints.swift
//  swipe_card_UI
//
//  Created by Jack Smith on 23/05/2020.
//  Copyright © 2020 jack-adam-smith. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Adds NSLayoutConstraints.
    /// All constraints are active by default.
    /// Note: sets translatesAutoresizingMaskIntoConstraints to false.
    ///
    /// - Parameters:
    ///   - centerXAnchor: The X axis anchor to center on.
    ///   - centerYAnchor: The Y axis anchor to center on.
    ///   - topAnchor: The top anchor to anchor to.
    ///   - leadingAnchor: The leading anchor to anchor to.
    ///   - bottomAnchor: The bottom anchor to anchor to.
    ///   - trailingAnchor: The trailing anchor to anchor to.
    ///   - widthAnchor: The width anchor to equal.
    ///   - heightAnchor: The height anchor to equal.
    ///   - positionConstants: Constants to apply to the x and y position. Has default value, can be excluded.
    ///   - borderPadding: Padding to apply to each border. Has default value, can be excluded.
    ///   - sizeAnchorConstants: Constants to apply to the width and height anchors of the view. Has default value, can be excluded.
    ///   - size: Constant size to apply to the view. Has default value, can be excluded.
    /// - Returns: Dictionary of contraints keyed by ConstraintKey.
    @discardableResult
    func constraints(centerXAnchor: NSLayoutXAxisAnchor?,
                     centerYAnchor: NSLayoutYAxisAnchor?,
                     topAnchor: NSLayoutYAxisAnchor?,
                     leadingAnchor: NSLayoutXAxisAnchor?,
                     bottomAnchor: NSLayoutYAxisAnchor?,
                     trailingAnchor: NSLayoutXAxisAnchor?,
                     widthAnchor: NSLayoutDimension?,
                     heightAnchor: NSLayoutDimension?,
                     positionConstants: CGPoint = .init(x: CGFloat.zero, y: CGFloat.zero),
                     borderPadding: UIEdgeInsets = .init(top: .zero, left: .zero, bottom: .zero, right: .zero),
                     sizeAnchorConstants: CGSize = .init(width: CGFloat.zero, height: CGFloat.zero),
                     size: CGSize? = nil) -> [ConstraintKey: NSLayoutConstraint] {
        
        var constraints = [ConstraintKey: NSLayoutConstraint]()
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if let centerXAnchor = centerXAnchor {
            let centerXConstraint = self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: positionConstants.x)
            constraints[ConstraintKey.CenterXConstraint] = centerXConstraint
        }
        
        if let centerYAnchor = centerYAnchor {
            let centerYConstraint = self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: positionConstants.y)
            constraints[ConstraintKey.CenterYConstraint] = centerYConstraint
        }
        
        if let topAnchor = topAnchor {
            let topConstraint = self.topAnchor.constraint(equalTo: topAnchor, constant: borderPadding.top)
            constraints[ConstraintKey.TopConstraint] = topConstraint
        }
        
        if let leadingAnchor = leadingAnchor {
            let leadingConstraint = self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: borderPadding.left)
            constraints[ConstraintKey.LeadingConstraint] = leadingConstraint
        }
        
        if let bottomAnchor = bottomAnchor {
            let bottomConstraint = self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -borderPadding.bottom)
            constraints[ConstraintKey.BottomConstraint] = bottomConstraint
        }
        
        if let trailingAnchor = trailingAnchor {
            let trailingConstraint = self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -borderPadding.right)
            constraints[ConstraintKey.TrailingConstraint] = trailingConstraint
        }
        
        if let widthAnchor = widthAnchor {
            let widthConstraint = self.widthAnchor.constraint(equalTo: widthAnchor, constant: sizeAnchorConstants.width)
            constraints[ConstraintKey.WidthConstraint] = widthConstraint
        }
        
        if let heightAnchor = heightAnchor {
            let heightConstraint = self.heightAnchor.constraint(equalTo: heightAnchor, constant: sizeAnchorConstants.height)
            constraints[ConstraintKey.HeightConstraint] = heightConstraint
        }
        
        if let size = size {
            if size.height != .zero {
                self.heightAnchor.constraint(equalToConstant: size.height).isActive = true
            }
            
            if size.width != .zero {
                self.widthAnchor.constraint(equalToConstant: size.width).isActive = true
            }
        }
        
        constraints.values.forEach {
            $0.isActive = true
        }
        
        return constraints
    }
}
