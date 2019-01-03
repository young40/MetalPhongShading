//
//  RenderModel.swift
//  MetalPS_iOS
//
//  Created by 杨世玲 on 2018/12/29.
//  Copyright © 2018 杨世玲. All rights reserved.
//

import Foundation
import MetalKit

extension Renderer
{
    @objc func onLoadModel(_ notification: Notification)
    {
        do {
            let metalAllocator = MTKMeshBufferAllocator(device: self.device)
            
            let mtlVertexDescriptor = Renderer.buildMetalVertexDescriptor()
            
            let mdlVertexDescriptor = MTKModelIOVertexDescriptorFromMetal(mtlVertexDescriptor)
            
            guard let attributes = mdlVertexDescriptor.attributes as? [MDLVertexAttribute] else {
                throw RendererError.badVertexDescriptor
            }
            
            attributes[VertexAttribute.position.rawValue].name = MDLVertexAttributePosition
            attributes[VertexAttribute.texcoord.rawValue].name = MDLVertexAttributeTextureCoordinate
            
            let filePath = notification.object as! String
            let url = URL(fileURLWithPath: filePath)
            
            let asset = MDLAsset(url: url, vertexDescriptor: mdlVertexDescriptor, bufferAllocator: metalAllocator)
            
            mesh = try MTKMesh.newMeshes(asset: asset, device: device).metalKitMeshes[0]
        } catch {
            
        }
        
        NotificationCenter.default.post(name: NotificationName.onLoadingModelDone, object: nil)
    }
    
    @objc func onLoadModelAsync(_ notification: Notification)
    {
        print("正在异步加载模型")
        let queue = DispatchQueue(label: "LoadModelAsync")
        
        queue.async {
            self.onLoadModel(notification)
        }
    }
}
