//
//  Utils.swift
//  CrazyRoad
//
//  Created by Ye Jiang on 12/31/18.
//  Copyright © 2018 Ye Jiang. All rights reserved.
//

import Foundation
import SceneKit

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
