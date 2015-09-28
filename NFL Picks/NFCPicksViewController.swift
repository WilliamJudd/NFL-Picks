//
//  ViewController.swift
//  NFL Picks
//
//  Created by William Judd on 9/26/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit
import Firebase
import Foundation
import AssetsLibrary
import MessageUI

class NFCPicksViewController: UIViewController {

    
    var recordRef: Firebase!
    var toRecipient: String!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    var animator: UIDynamicAnimator!
    var collisionBehavior: UICollisionBehavior!
    var pushBehavior: UIPushBehavior!
    var itemBehavior: UIDynamicItemBehavior!
    
    @IBOutlet weak var bucs: UIButton!
    @IBOutlet weak var cardinals: UIButton!
    @IBOutlet weak var cowboys: UIButton!
    @IBOutlet weak var eagles: UIButton!
    @IBOutlet weak var falcons: UIButton!
    @IBOutlet weak var giants: UIButton!
    @IBOutlet weak var greenbay: UIButton!
    @IBOutlet weak var panthers: UIButton!
    @IBOutlet weak var rams: UIButton!
    @IBOutlet weak var redskins: UIButton!
    @IBOutlet weak var saints: UIButton!
    @IBOutlet weak var seahawks: UIButton!
    @IBOutlet weak var vikings: UIButton!
    @IBOutlet weak var lions: UIButton!
    @IBOutlet weak var bears: UIButton!
    @IBOutlet weak var niners: UIButton!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        self.collisionBehavior = UICollisionBehavior(items: [bucs,cardinals,cowboys,eagles,falcons,giants,greenbay,panthers,rams,redskins,saints,seahawks,vikings,lions,bears,niners])
        self.collisionBehavior.translatesReferenceBoundsIntoBoundary = true;
        
        
        self.addCollisionBoundaryForTopEdgeOfView(self.topView, withIdentifier: "topViewTopBoundary")
        self.addCollisionBoundaryForTopEdgeOfView(self.bottomView, withIdentifier: "bottomViewTopBoundary")
        
        
        
        self.addCollisionBoundaryForBottomEdgeOfView(self.topView, withIdentifier: "topViewBottomBoundary")
        self.addCollisionBoundaryForBottomEdgeOfView(self.bottomView, withIdentifier: "bottomViewBottomBoundary")
        
        
        
        self.itemBehavior = UIDynamicItemBehavior(items: [bucs,cardinals,cowboys,eagles,falcons,giants,greenbay,panthers,rams,redskins,saints,seahawks,vikings,lions,bears,niners])
        self.itemBehavior.elasticity = 1.0
        self.itemBehavior.addLinearVelocity(CGPointMake(10, 10), forItem: bucs)
        self.itemBehavior.addLinearVelocity(CGPointMake(10, 10), forItem: bears)
        self.itemBehavior.addLinearVelocity(CGPointMake(10, 10), forItem: saints)
        self.itemBehavior.addLinearVelocity(CGPointMake(10, 10), forItem: rams)
        
        
        
        self.pushBehavior = UIPushBehavior(items: [bucs,cardinals,cowboys,eagles,falcons,giants,greenbay,panthers,rams,redskins,saints,seahawks,vikings,lions,bears,niners], mode: UIPushBehaviorMode.Instantaneous)
        self.pushBehavior.pushDirection = CGVectorMake(10, 10)
        self.pushBehavior.active = true

        
        self.animator = UIDynamicAnimator(referenceView: self.view)
        self.animator.addBehavior(self.itemBehavior)
        self.animator.addBehavior(self.pushBehavior)
        self.animator.addBehavior(self.collisionBehavior)

    
        let bubbles = [self.bucs,self.cardinals,self.cowboys,self.eagles,self.falcons,self.giants,self.greenbay,self.panthers,self.rams,self.redskins,self.saints,self.seahawks,self.vikings,self.lions,self.bears,self.niners]
    
        for bt in bubbles{
            
            // Circle move
            let pathAnimation = CAKeyframeAnimation(keyPath: "position")
            pathAnimation.calculationMode = kCAAnimationPaced
            pathAnimation.fillMode = kCAFillModeForwards
            pathAnimation.removedOnCompletion = false
            pathAnimation.repeatCount = Float.infinity
            pathAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            
            if (bt == self.bucs) {
                pathAnimation.duration = 5.0
            }else if (bt == self.cardinals){
                pathAnimation.duration = 6.0
            }else if (bt == self.cowboys){
                pathAnimation.duration = 7.0
            }else if (bt == self.eagles){
                pathAnimation.duration = 8.0
            }else if (bt == self.falcons){
                pathAnimation.duration = 6.0
            }else if (bt == self.giants){
                pathAnimation.duration = 7.0
            }else if (bt == self.greenbay){
                pathAnimation.duration = 8.0
            }else if (bt == self.panthers){
                pathAnimation.duration = 6.0
            }else if (bt == self.rams){
                pathAnimation.duration = 7.0
            }else if (bt == self.redskins){
                pathAnimation.duration = 8.0
            }else if (bt == self.saints){
                pathAnimation.duration = 6.0
            }else if (bt == self.seahawks){
                pathAnimation.duration = 7.0
            }else if (bt == self.vikings){
                pathAnimation.duration = 8.0
            }else if (bt == self.lions){
                pathAnimation.duration = 6.0
            }else if (bt == self.bears){
                pathAnimation.duration = 7.0
            }else if (bt == self.niners){
                pathAnimation.duration = 8.0
            }
            
            
            let curvedPath = CGPathCreateMutable()
            let circleContainer = CGRectInset(bt.frame, bt.frame.size.width/2-3, bt.frame.size.width/2-3)
            CGPathAddEllipseInRect(curvedPath, nil, circleContainer)
            pathAnimation.path = curvedPath
            bt.layer.addAnimation(pathAnimation, forKey: "myCircleAnimation")
            
            
            // scale in X
            let scaleX = CAKeyframeAnimation(keyPath:"transform.scale.x")
            scaleX.values   =  [1.0, 1.1, 1.0]
            scaleX.keyTimes =  [0.0, 0.5,1.0]
            scaleX.repeatCount = Float.infinity
            scaleX.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            
            if (bt == self.bucs) {
                scaleX.duration = 3
            }else if (bt == self.cardinals){
                scaleX.duration = 4
            }else if (bt == self.cowboys){
                scaleX.duration = 6
            }else if (bt == self.eagles){
                scaleX.duration = 5
            }else if (bt == self.falcons){
                scaleX.duration = 4
            }else if (bt == self.giants){
                scaleX.duration = 6
            }else if (bt == self.greenbay){
                scaleX.duration = 5
            }else if (bt == self.panthers){
                scaleX.duration = 4
            }else if (bt == self.rams){
                scaleX.duration = 6
            }else if (bt == self.redskins){
                scaleX.duration = 5
            }else if (bt == self.saints){
                scaleX.duration = 4
            }else if (bt == self.seahawks){
                scaleX.duration = 6
            }else if (bt == self.vikings){
                scaleX.duration = 5
            }else if (bt == self.lions){
                scaleX.duration = 4
            }else if (bt == self.bears){
                scaleX.duration = 6
            }else if (bt == self.niners){
                scaleX.duration = 5
            }
            
            
            
            bt.layer.addAnimation(scaleX, forKey: "scaleXAnimation")
            
            
            
            //2.Y方向上的缩放 scale in Y
            let scaleY = CAKeyframeAnimation(keyPath:"transform.scale.y")
            scaleY.values = [1.0, 1.1, 1.0]
            scaleY.keyTimes = [0.0, 0.5,1.0]
            scaleY.repeatCount = Float.infinity
            scaleY.autoreverses = true
            scaleX.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            
            if (bt == self.bucs) {
                scaleY.duration = 3
            }else if (bt == self.cardinals){
                scaleY.duration = 4
            }else if (bt == self.cowboys){
                scaleY.duration = 6
            }else if (bt == self.eagles){
                scaleY.duration = 5
            }else if (bt == self.falcons){
                scaleY.duration = 4
            }else if (bt == self.giants){
                scaleY.duration = 6
            }else if (bt == self.greenbay){
                scaleY.duration = 5
            }else if (bt == self.panthers){
                scaleY.duration = 4
            }else if (bt == self.rams){
                scaleY.duration = 6
            }else if (bt == self.redskins){
                scaleY.duration = 5
            }else if (bt == self.saints){
                scaleY.duration = 4
            }else if (bt == self.seahawks){
                scaleY.duration = 6
            }else if (bt == self.vikings){
                scaleY.duration = 5
            }else if (bt == self.lions){
                scaleY.duration = 4
            }else if (bt == self.bears){
                scaleY.duration = 6
            }else if (bt == self.niners){
                scaleY.duration = 5
            }
            
            bt.layer.addAnimation(scaleY, forKey: "scaleYAnimation")
        }
        
    
    }
    
    
    func addCollisionBoundaryForTopEdgeOfView(view: UIView, withIdentifier identifier: NSString) {
        
        let origin = view.frame.origin
        let topRightPoint = CGPointMake(origin.x + view.frame.size.width, origin.y)
        
        //usamos os pontos do topo (esquerda e direita) da view para criar o boundary que vai simular a borda de cima da view
        self.collisionBehavior.addBoundaryWithIdentifier(identifier, fromPoint: origin, toPoint: topRightPoint)
        
    }
    
    func addCollisionBoundaryForBottomEdgeOfView(view: UIView, withIdentifier identifier: NSString) {
        let origin = view.frame.origin
        let bottomLeftPoint = CGPointMake(origin.x, origin.y + view.frame.size.height)
        let bottomRightPoint = CGPointMake(origin.x + view.frame.size.width, bottomLeftPoint.y)
        
        //usamos os pontos do fundo (esquerdo e direito) da view para criar um boundary que vai simular a borda de baixo da view
        self.collisionBehavior.addBoundaryWithIdentifier(identifier, fromPoint: bottomLeftPoint, toPoint: bottomRightPoint)
    }
    
    override func viewWillAppear(animated: Bool) {
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



