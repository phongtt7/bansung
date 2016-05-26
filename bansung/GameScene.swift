//
//  GameScene.swift
//  bansung
//
//  Created by Phong Tran on 4/20/16.
//  Copyright (c) 2016 uit. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var robot:SKSpriteNode!
    var bullet:SKSpriteNode!
    let r1:SKTexture = SKTexture(imageNamed: "1.png")
    let r2:SKTexture = SKTexture(imageNamed: "2.png")
    let r3:SKTexture = SKTexture(imageNamed: "3.png")
    let r4:SKTexture = SKTexture(imageNamed: "4.png")
    let r5:SKTexture = SKTexture(imageNamed: "5.png")
    let r6:SKTexture = SKTexture(imageNamed: "6.png")
    let r7:SKTexture = SKTexture(imageNamed: "7.png")
    let r8:SKTexture = SKTexture(imageNamed: "8.png")
    
    override func didMoveToView(view: SKView) {
//        self.backgroundColor = UIColor.whiteColor()
        robot = SKSpriteNode(texture: r1)
        robot.position = CGPoint(x: 100, y: self.frame.size.height/2)
        robot.size = CGSize(width: robot.size.width*4, height: robot.size.height*4)
        self.addChild(robot)
        
        let chay:SKAction = SKAction.animateWithTextures([r1,r2,r3,r4,r5,r6], timePerFrame: 0.2)
        let chathoai:SKAction = SKAction.repeatActionForever(chay)
        robot.runAction(chathoai)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
//            let location = touch.locationInNode(self)
            let chay:SKAction = SKAction.animateWithTextures([r7], timePerFrame: 0.2)
            robot.runAction(chay)
            
            let shoot:SKSpriteNode = SKSpriteNode(texture: r8)
            shoot.size = CGSize(width: shoot.size.width/4, height: shoot.size.height/4)
            shoot.position = CGPoint(x: robot.position.x + robot.frame.size.width - 28, y: robot.position.y + 30)
            self.addChild(shoot)
            
//            let xoay:SKAction = SKAction.rotateByAngle(<#T##radians: CGFloat##CGFloat#>, duration: <#T##NSTimeInterval#>)
//            shoot.runAction(xoay)
            
            let ban:SKAction = SKAction.moveToX(self.frame.size.width + 100, duration: 3)
            shoot.runAction(ban)
            
            let sound:SKAction = SKAction.playSoundFileNamed("shoot.mp3", waitForCompletion: false)
            shoot.runAction(sound)
            
            let path = NSBundle.mainBundle().pathForResource("lua", ofType: "sks")
            let Lua = NSKeyedUnarchiver.unarchiveObjectWithFile(path!) as! SKEmitterNode
            Lua.position = CGPoint(x: shoot.position.x - 30, y: shoot.position.y)
            self.addChild(Lua)
            
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
