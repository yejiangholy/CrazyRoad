//
//  Utils.swift
//  CrazyRoad
//
//  Created by Ye Jiang on 12/31/18.
//  Copyright © 2018 Ye Jiang. All rights reserved.
//

import Foundation
import SceneKit

struct Models {
    private static let treeScene = SCNScene(named: "art.scnassets/Tree.scn")!
    static let tree = treeScene.rootNode.childNode(withName: "tree", recursively: true)!
    
    private static let hedgeScene = SCNScene(named: "art.scnassets/Hedge.scn")!
    static let hedge = hedgeScene.rootNode.childNode(withName: "hedge", recursively: true)!
    
    private static let purpleCarScene = SCNScene(named: "art.scnassets/PurpleCar.scn")!
    static let purpleCar = purpleCarScene.rootNode.childNode(withName: "purplecar", recursively: true)!
    
    private static let redCarScene = SCNScene(named: "art.scnassets/RedCar.scn")!
    static let redCar = redCarScene.rootNode.childNode(withName: "redcar", recursively: true)!
    
    private static let blueTrunkScene = SCNScene(named: "art.scnassets/BlueTruck.scn")!
    static let blueTrunck = blueTrunkScene.rootNode.childNode(withName: "truck", recursively: true)!
    
    private static let firetruckScene = SCNScene(named: "art.scnassets/Firetruck.scn")!
    static let firetruck = firetruckScene.rootNode.childNode(withName: "truck", recursively: true)! 
    
    
}

let degreePerRadians = Float(Double.pi/180)
let radiansPerDegrees = Float(180/Double.pi)

func toRadians(angle:Float) -> Float{
    return angle*degreePerRadians
}

func toRadians(angle:CGFloat) -> CGFloat{
    return angle * CGFloat(degreePerRadians)
}

func randomBool(odds:Int) -> Bool {
    let random = arc4random_uniform(UInt32(odds))
    if random < 1{
        return true
    }else {return false}
}
