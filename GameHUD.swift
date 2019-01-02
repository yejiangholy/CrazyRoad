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
    
    init(with size: CGSize, menu: Bool){
        super.init(size: size)
        if menu{
            addMenuLables()
        }else{
            addPointsLable()
        }
    }
    
    func addMenuLables(){
        logoLabel = SKLabelNode(fontNamed: "BBIT WONDER Nominal")
        tapToPlayLable = SKLabelNode(fontNamed: "BBIT WONDER Nominal")
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
        pointsLable = SKLabelNode(fontNamed: "BBIT WONDER Nominal")
        guard let pointsLable = pointsLable else{return}
        pointsLable.text = "0"
        pointsLable.fontSize = 40.0
        pointsLable.position = CGPoint(x: frame.minX + pointsLable.frame.size.width, y: frame.maxY - pointsLable.frame.size.height*2)
        addChild(pointsLable)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}