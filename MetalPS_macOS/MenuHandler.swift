//
//  MenuHandler.swift
//  MetalPS_macOS
//
//  Created by 杨世玲 on 2018/12/26.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation
import AppKit

class MenuHander
{
    init()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(onOpenFile(_:)),  name: NotificationName.onOpenFile,  object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onExportPNG(_:)), name: NotificationName.onExportPNG, object: nil)
    }
    
    @objc func onOpenFile(_ notification: Notification)
    {
        
    }
    
    @objc func onExportPNG(_ notification: Notification)
    {
        
    }
}