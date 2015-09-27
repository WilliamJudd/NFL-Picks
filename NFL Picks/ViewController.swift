//
//  ViewController.swift
//  NFL Picks
//
//  Created by William Judd on 9/26/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}



