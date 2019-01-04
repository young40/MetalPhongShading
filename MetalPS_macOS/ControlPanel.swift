//
//  ControlPanel.swift
//  MetalPS_macOS
//
//  Created by Shiling Yang on 2019/1/4.
//  Copyright © 2019 杨世玲. All rights reserved.
//

import Foundation
import Cocoa

@IBDesignable class ControlPanel: NSView {
    @IBOutlet var controlpanelView: NSView!
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        
        let nibName = type(of: self).className().components(separatedBy: ".").last!
        
        if let nib = NSNib(nibNamed: nibName, bundle: Bundle(for: type(of: self))) {
            nib.instantiate(withOwner: self, topLevelObjects: nil)
            
            for newView in controlpanelView.subviews {
                self.addSubview(newView)
            }
        } else {
            print("load nib failed")
        }
    }
}
