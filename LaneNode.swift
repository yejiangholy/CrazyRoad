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

class TrafficNode:SCNNode {
    let type: Int
    let directionRight:Bool
    
    init(type:Int , directionRight:Bool){
        self.type = type
        self.directionRight = directionRight
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LaneNode: SCNNode {

    let type: LaneType
    var trafficNode: TrafficNode?
    
    init(type: LaneType, width:CGFloat){
        self.type = type
        super.init()
        
        switch type {
        case .grass:
            guard let texture = UIImage(named: "art.scnassets/grass.png")else {break}
            createLane(width: width, height: 0.4, image: texture)
        case .road:
            guard let texture = UIImage(named: "art.scnassets/asphalt.png")else {break}
            trafficNode = TrafficNode(type: Int(arc4random_uniform(UInt32(4))), directionRight: randomBool(odds: 2))
            addChildNode(trafficNode!)
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
        addElements(width, laneNode)
    }
    
    func addElements(_ width:CGFloat, _ laneNode:SCNNode){
        var carGap = 0
        for index in 0..<Int(width){
            if type == .grass{
                if randomBool(odds: 7){
                    let vegetation = getVegetation()
                    vegetation.position = SCNVector3(x: 10-Float(index), y: 0, z: 0)
                    laneNode.addChildNode(vegetation)
                }
            }else if type == .road {
                carGap += 1
                if carGap > 3 {
                    guard let trafficNode = trafficNode else {continue}
                    if randomBool(odds: 4){
                        carGap = 0
                        let vehicle = getVehicle(for: trafficNode.type)
                        vehicle.position = SCNVector3(x: 10-Float(index), y: 0, z: 0)
                        vehicle.eulerAngles = trafficNode.directionRight ? SCNVector3Zero : SCNVector3(0, toRadians(angle: CGFloat(180)), 0)
                        trafficNode.addChildNode(vehicle)
                    }
                }
            }
        }
    }
    
    func getVegetation() -> SCNNode{
        let vegetation = randomBool(odds: 2) ? Models.tree.clone() : Models.hedge.clone()
        return vegetation
    }
    
    func getVehicle(for type:Int) -> SCNNode{
        switch type {
        case 0:
            return Models.blueTrunck.clone()
        case 1:
            return Models.firetruck.clone()
        case 2:
            return Models.redCar.clone()
        case 3:
            return Models.purpleCar.clone()
        default:
            return Models.blueTrunck.clone()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
}
