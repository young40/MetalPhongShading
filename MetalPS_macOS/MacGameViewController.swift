//
//  GameViewController.swift
//  MetalPhongShading macOS
//
//  Created by 杨世玲 on 2018/12/21.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Cocoa
import MetalKit

// Our macOS specific view controller
class MacGameViewController: NSViewController {

    var renderer: Renderer!
    var mtkView: MTKView!
    
    @IBOutlet weak var slider: NSSlider!
    @IBOutlet weak var loading: NSProgressIndicator!
    
    private let menuHandler = MenuHander()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onLoadingModelStart(_:)), name: NotificationName.onLoadingModelStart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onLoadingModelDone(_:)), name: NotificationName.onLoadingModelDone, object: nil)

        guard let mtkView = self.view as? MTKView else {
            print("View attached to GameViewController is not an MTKView")
            return
        }

        // Select the device to render with.  We choose the default device
        guard let defaultDevice = MTLCreateSystemDefaultDevice() else {
            print("Metal is not supported on this device")
            return
        }

        mtkView.device = defaultDevice

        guard let newRenderer = Renderer(metalKitView: mtkView) else {
            print("Renderer cannot be initialized")
            return
        }

        renderer = newRenderer

        renderer.mtkView(mtkView, drawableSizeWillChange: mtkView.drawableSize)

        mtkView.delegate = renderer
        
        onChange(slider)
    }
    
    @IBAction func onChange(_ sender: NSSlider) {
        print("\(sender.floatValue)")
//        renderer.step = Float(sender.doubleValue)
        NotificationCenter.default.post(name: NotificationName.onChange, object: nil, userInfo: ["value": sender.doubleValue])
    }
    
    @objc func onLoadingModelStart(_ notification: Notification)
    {
        loading.startAnimation(nil)
        loading.isHidden = false
    }
    
    @objc func onLoadingModelDone(_ notification: Notification)
    {
        loading.stopAnimation(nil)
        loading.isHidden = true
    }
}
