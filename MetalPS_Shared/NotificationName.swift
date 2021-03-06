//
//  NotificationName.swift
//  MetalPS_iOS
//
//  Created by 杨世玲 on 2018/12/26.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation

class NotificationName
{
    static let onOpenFile  = Notification.Name("onOpenFile")
    static let onExportPNG = Notification.Name("onExportPNG")
    
    static let onChange    = Notification.Name("onChange")
    
    static let onLoadModel         = Notification.Name("onLoadModel")
    static let onLoadModelAsync    = Notification.Name("onLoadModelAsync")
    static let onLoadingModelStart = Notification.Name("onLoadingModelStart")
    static let onLoadingModelDone  = Notification.Name("onLoadingModelDone")
    
    static let onScale = Notification.Name("onScale")
    static let onMoveX = Notification.Name("onMoveX")
    static let onMoveY = Notification.Name("onMoveY")
}
