//
//  LaneNode.swift
//  CrazyRoad
//
//  Created by Ye Jiang on 12/31/18.
//  Copyright © 2018 Ye Jiang. All rights reserved.
//

import SceneKit

enum LaneType{
    case grass, road
}

class LaneNode: SCNNode {

    let type: LaneType
    
    init(type: LaneType, width:CGFloat){
        self.type = type
        super.init()
        
        switch type {
        case .grass:
            guard let texture = UIImage(named: "art.scnassets/grass.png")else {break}
            createLane(width: width, height: 0.4, image: texture)
        case .road:
            guard let texture = UIImage(named: "art.scnassets/asphalt.png")else {break}
            createLane(width: width, height: 0.05, image: texture)
        }
    }
    
    func createLane(width: CGFloat, height: CGFloat, image: UIImage){
        let laneGeometry  = SCNBox(width: width, height: height, length: 1, chamferRadius: 0)
        laneGeometry.firstMaterial?.diffuse.contents = image
        laneGeometry.firstMaterial?.diffuse.wrapT = .repeat
        laneGeometry.firstMaterial?.diffuse.wrapS = .repeat
        laneGeometry.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(Float(width), 1, 1)
        let laneNode = SCNNode(geometry: laneGeometry)
        addChildNode(laneNode)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
}
