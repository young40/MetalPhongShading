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
class GameViewController: NSViewController {

    var renderer: Renderer!
    var mtkView: MTKView!
    
    @IBOutlet weak var slider: NSSlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.maxValue = 0.004
        slider.maxValue = 0.1
        
//        slider.acceptsFirstMouse(for: <#T##NSEvent?#>)

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
        renderer.step = Float(sender.doubleValue)
    }
}
