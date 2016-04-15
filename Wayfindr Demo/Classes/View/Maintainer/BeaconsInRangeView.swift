//
//  BeaconsInRangeView.swift
//  Wayfindr Demo
//
//  Created by Wayfindr on 12/11/2015.
//  Copyright (c) 2016 Wayfindr (http://www.wayfindr.net)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights 
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all 
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
//  SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import UIKit

final class BeaconsInRangeView: BaseView {


    // MARK: - Properties
    
    private let locatingLabel = UILabel()
    private let scrollView = UIScrollView()
    
    let headerView = BeaconsInRangeHeaderView()
    let bodyView = BeaconsInRangeBodyView()
    
    var locatingLabelHidden = true {
        didSet {
            locatingLabel.hidden = locatingLabelHidden
            scrollView.hidden = !locatingLabelHidden
        }
    }
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        headerView.addBorder(edges: [.Bottom], colour: WAYConstants.WAYColors.Border, thickness: 3.0)
        
        locatingLabel.text = WAYStrings.BeaconsInRange.NoBeacons
        locatingLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        locatingLabel.textAlignment = .Center
        locatingLabel.textColor = WAYConstants.WAYColors.Maintainer
        locatingLabel.lineBreakMode = .ByWordWrapping
        locatingLabel.numberOfLines = 0
        
        locatingLabelHidden = false
        
        addSubview(locatingLabel)
        addSubview(scrollView)
        
        scrollView.addSubview(headerView)
        scrollView.addSubview(bodyView)
    }
    
    
    // MARK: - Layout
    
    override func setupConstraints() {
        super.setupConstraints()
        
        // Turn off autoresizing mask
        locatingLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        bodyView.translatesAutoresizingMaskIntoConstraints = false
        
        // View Dictionary
        let views = ["locatingLabel" : locatingLabel, "scrollView" : scrollView, "headerView" : headerView, "bodyView" : bodyView]
        
        // Vertical Constraints
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[locatingLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: WAYConstants.WAYLayout.metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-HalfMargin-[scrollView]-HalfMargin-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: WAYConstants.WAYLayout.metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[headerView][bodyView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: WAYConstants.WAYLayout.metrics, views: views))
        
        // Horizontal Constraints
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[locatingLabel]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: WAYConstants.WAYLayout.metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-HalfMargin-[scrollView]-HalfMargin-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: WAYConstants.WAYLayout.metrics, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[headerView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[bodyView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: views))
        
        addConstraint(NSLayoutConstraint(item: headerView.titleLabel, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 1.0, constant: -4.0 * WAYConstants.WAYLayout.HalfMargin))
    }
    
    
    // MARK: - Set Text
    
    func setLocatingLabelText(text: String) {
        locatingLabel.text = text
    }
    
}

final class BeaconsInRangeHeaderView: BaseStackView {
    
    
    // MARK: - Properties
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let bodyLabel = UILabel()
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        titleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
        subtitleLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)
        bodyLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
        titleLabel.text = WAYStrings.CommonStrings.Beacon.uppercaseString
        subtitleLabel.text = WAYStrings.CommonStrings.Minor
        
        titleLabel.textAlignment = .Center
        subtitleLabel.textAlignment = .Center
        bodyLabel.textAlignment = .Center
        
        stackView.alignment = .Center
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(bodyLabel)
    }
    
}

final class BeaconsInRangeBodyView: BaseStackView {
    
    
    // MARK: - Properties
    
    let txPowerLabel            = KeyValueLabel()
    let rssiLabel               = KeyValueLabel()
    let accuracyLabel           = KeyValueLabel()
    let advertisingRateLabel    = KeyValueLabel()
    let batteryLabel            = KeyValueLabel()
    let uuidLabel               = KeyValueLabel()
    let majorLabel              = KeyValueLabel()
    let minorLabel              = KeyValueLabel()
    
    
    // MARK: - Setup
    
    override func setup() {
        super.setup()
        
        let colonText = ": "
        
        txPowerLabel.keyLabel.text = WAYStrings.BeaconsInRange.TxPower + colonText
        rssiLabel.keyLabel.text = WAYStrings.BeaconsInRange.RSSI + colonText
        accuracyLabel.keyLabel.text = WAYStrings.BeaconsInRange.Accuracy + colonText
        advertisingRateLabel.keyLabel.text = WAYStrings.BeaconsInRange.AdvertisingRate + colonText
        batteryLabel.keyLabel.text = WAYStrings.CommonStrings.Battery + colonText
        uuidLabel.keyLabel.text = WAYStrings.BeaconsInRange.UUID + colonText
        majorLabel.keyLabel.text = WAYStrings.CommonStrings.Major + colonText
        minorLabel.keyLabel.text = WAYStrings.CommonStrings.Minor + colonText
        
        let keyLabelColor = WAYConstants.WAYColors.Maintainer
        
        txPowerLabel.keyLabel.textColor = keyLabelColor
        rssiLabel.keyLabel.textColor = keyLabelColor
        accuracyLabel.keyLabel.textColor = keyLabelColor
        advertisingRateLabel.keyLabel.textColor = keyLabelColor
        batteryLabel.keyLabel.textColor = keyLabelColor
        uuidLabel.keyLabel.textColor = keyLabelColor
        majorLabel.keyLabel.textColor = keyLabelColor
        minorLabel.keyLabel.textColor = keyLabelColor
        
        uuidLabel.valueLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        
        stackView.addArrangedSubview(txPowerLabel)
        stackView.addArrangedSubview(rssiLabel)
        stackView.addArrangedSubview(accuracyLabel)
        stackView.addArrangedSubview(advertisingRateLabel)
        stackView.addArrangedSubview(batteryLabel)
        stackView.addArrangedSubview(uuidLabel)
        stackView.addArrangedSubview(majorLabel)
        stackView.addArrangedSubview(minorLabel)
    }
    
}
