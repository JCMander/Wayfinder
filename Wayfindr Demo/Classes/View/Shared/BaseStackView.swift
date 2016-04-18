//
//  BaseStackView.swift
//  Wayfindr Demo
//
//  Created by Wayfindr on 12/11/2015.
//  Copyright © 2015 ustwo. All rights reserved.
//

import UIKit

class BaseStackView: BaseView {
    
    // MARK: - Properties
    
    let stackView = UIStackView()
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        stackView.axis = .Vertical
        stackView.distribution = .EqualSpacing
        stackView.spacing = WAYConstants.WAYLayout.HalfMargin
        
        addSubview(stackView)
    }
    
    
    // MARK: - Layout
    
    override func setupConstraints() {
        super.setupConstraints()
        
        // Turn off autoresizing mask
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // View Dictionary
        let views = ["stackView" : stackView]
        let metrics = WAYConstants.WAYLayout.metrics
        
        // Vertical Constraints
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-HalfMargin-[stackView]-HalfMargin-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        
        // Horizontal Constraints
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-HalfMargin-[stackView]-HalfMargin-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
    }
    
}
