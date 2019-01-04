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
    }
}
