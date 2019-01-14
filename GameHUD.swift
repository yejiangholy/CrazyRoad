//
//  GameHUD.swift
//  CrazyRoad
//
//  Created by Ye Jiang on 1/2/19.
//  Copyright © 2019 Ye Jiang. All rights reserved.
//

import SpriteKit

class GameHUD: SKScene {
    
    var logoLabel: SKLabelNode?
    var tapToPlayLable: SKLabelNode?
    var pointsLable: SKLabelNode?
    var highestPointsLable: SKLabelNode? // display highestPoints
    var highestPoints:Int?
    
    init(with size: CGSize, menu: Bool, record:Int){
        super.init(size: size)
        if menu{
            addMenuLables()
        }else{
            addHighestPointsLable(record: record)
            addPointsLable()
        }
    }
    
    func addMenuLables(){
        logoLabel = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        tapToPlayLable = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        guard let logoLable = logoLabel, let tapToPlayLable = tapToPlayLable else {return}
        logoLable.text = "Crazy Road"
        logoLable.fontSize = 35.0
        logoLable.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(logoLable)
        
        tapToPlayLable.text = "Tap to Play"
        tapToPlayLable.fontSize = 25.0
        tapToPlayLable.position = CGPoint(x: frame.midX, y: frame.midY - logoLable.frame.size.height)
        addChild(tapToPlayLable)
    }
    
    func addPointsLable(){
        pointsLable = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
        guard let pointsLable = pointsLable else{return}
        pointsLable.text = "0"
        pointsLable.fontSize = 40.0
        pointsLable.position = CGPoint(x: frame.minX + pointsLable.frame.size.width, y: frame.maxY - pointsLable.frame.size.height*2 - highestPointsLable!.frame.size.height*2)
        addChild(pointsLable)
    }
    
    func addHighestPointsLable(record: Int){
         highestPointsLable = SKLabelNode(fontNamed: "8BIT WONDER Nominal")
         guard let highestPointsLable = highestPointsLable else{return}
        highestPointsLable.text = String(record)
        highestPointsLable.fontSize = 40.0
        highestPointsLable.position = CGPoint(x: frame.minX + highestPointsLable.frame.size.width, y: frame.maxY - highestPointsLable.frame.size.height*2)
        addChild(highestPointsLable)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
