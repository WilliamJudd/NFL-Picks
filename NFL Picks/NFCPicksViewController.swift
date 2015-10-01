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
import AVFoundation

class NFCPicksViewController: UIViewController {
    
// Bubble Animation
    
    var bubbleSound: SystemSoundID!
    let defaultDuration = 2.0
    let defaultDamping = 0.20
    let defaultVelocity = 6.0
    
// Firebase
    
    var recordRef: Firebase!
    var toRecipient: String!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
// Progress Indicator
    
    
    var currentCount = 0.0
    let maxCount = 5.0
    
  
// Dynamics
    
    var animator: UIDynamicAnimator!
    var collisionBehavior: UICollisionBehavior!
    var pushBehavior: UIPushBehavior!
    var pushBehavior2: UIPushBehavior!
    var itemBehavior: UIDynamicItemBehavior!
    var gravity: UIGravityBehavior!
    
// Alert View
    var overlayView: UIView!
    var alertView: UIView!
    var attachmentBehavior : UIAttachmentBehavior!
    var snapBehavior : UISnapBehavior!
    
    
    @IBOutlet weak var circularProgressView: KDCircularProgress!
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
    @IBOutlet weak var nfcLogo: UIImageView!
    
    
    
    
    var nfcPicks: NSMutableArray = []
    
   

    
    
    
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        self.animator = UIDynamicAnimator(referenceView: self.view)
        circularProgressView.angle = 0
        createOverlay()
        createAlert()
        

        
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
    
    func createOverlay() {
        // Create a gray view and set its alpha to 0 so it isn't visible
        overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = UIColor.grayColor()
        overlayView.alpha = 0.0
        view.addSubview(overlayView)
    }
    
    func createAlert() {
        // Here the red alert view is created. It is created with rounded corners and given a shadow around it
        let alertWidth: CGFloat = 450
        let alertHeight: CGFloat = 375
        let alertViewFrame: CGRect = CGRectMake(0, 0, alertWidth, alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor.redColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.shadowOffset = CGSizeMake(0, 5);
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        
        // Create a button and set a listener on it for when it is tapped. Then the button is added to the alert view
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.setTitle("Dismiss", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.whiteColor()
        
        button.frame = CGRectMake(0, 0, alertWidth, 40.0)
        button.layer.cornerRadius = 2
        button.addTarget(self, action: Selector("dismissAlert"), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        let button2 = UIButton(type: UIButtonType.System) as UIButton
        button2.setTitle("Pick AFC", forState: UIControlState.Normal)
        button2.backgroundColor = UIColor.whiteColor()
        button2.addTarget(self, action: Selector("afcPicks"), forControlEvents: UIControlEvents.TouchUpInside)
        button2.frame = CGRectMake(0, 135, alertWidth, 40.0)
        button2.layer.cornerRadius = 2
        button2
        alertView.addSubview(button)
        alertView.addSubview(button2)
        view.addSubview(alertView)
    }

    
    
    
    
    func showAlert() {
        // When the alert view is dismissed, I destroy it, so I check for this condition here
        // since if the Show Alert button is tapped again after dismissing, alertView will be nil
        // and so should be created again
        if (alertView == nil) {
            createAlert()
        }
        
        
        
        animator.removeAllBehaviors()
        
        // Animate in the overlay
        UIView.animateWithDuration(0.4) {
            self.overlayView.alpha = 1.0
        }
        
        // Animate the alert view using UIKit Dynamics.
        alertView.alpha = 1.0
        
        let snapBehaviour: UISnapBehavior = UISnapBehavior(item: alertView, snapToPoint: view.center)
        animator.addBehavior(snapBehaviour)
    }
    
    
 
    func afcPicks () {
        
        performSegueWithIdentifier("afcpicks", sender: self)
        
        }
    
    
    


    func dismissAlert() {
        
        animator.removeAllBehaviors()
        
        let gravityBehaviour: UIGravityBehavior = UIGravityBehavior(items: [alertView])
        gravityBehaviour.gravityDirection = CGVectorMake(0.0, 10.0);
        animator.addBehavior(gravityBehaviour)
        
        // This behaviour is included so that the alert view tilts when it falls, otherwise it will go straight down
        let itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [alertView])
        itemBehaviour.addAngularVelocity(CGFloat(-M_PI_2), forItem: alertView)
        animator.addBehavior(itemBehaviour)
        
        // Animate out the overlay, remove the alert view from its superview and set it to nil
        // If you don't set it to nil, it keeps falling off the screen and when Show Alert button is
        // tapped again, it will snap into view from below. It won't have the location settings we defined in createAlert()
        // And the more it 'falls' off the screen, the longer it takes to come back into view, so when the Show Alert button
        // is tapped again after a considerable time passes, the app seems unresponsive for a bit of time as the alert view
        // comes back up to the screen
        UIView.animateWithDuration(0.4, animations: {
            self.overlayView.alpha = 0.0
            }, completion: {
                (value: Bool) in
                self.alertView.removeFromSuperview()
                self.alertView = nil
    
                
        })
        
    }
        

    
    
    
    @IBAction func teamProgressButtonTapped(sender: UIButton) {
        
        
     
            
        
        print(nfcPicks)
        
        
        // add or subtract button to/from array
        // do circle progress animation
        // check to see if we've reached max count compared to array size
        // if maxcount is reached, throw up alert
        if currentCount != (maxCount) {
            currentCount += 1
            let newAngleValue = newAngle()
            circularProgressView.animateToAngle(newAngleValue, duration: 0.5, completion: nil)
            self.nfcPicks.addObject(sender)
            
            if sender == nfcPicks {
            currentCount -= 1
            self.nfcPicks.removeLastObject()
                
   
            }
            print(nfcPicks)
            
        }else{
            
            showAlert()
           
        }
    }
    
    func newAngle() -> Int {
        return Int(360 * (currentCount / maxCount))
    }
    
//    @IBAction func resetButtonTapped(sender: UIButton) {
//        currentCount = 0
//        circularProgressView.animateFromAngle(circularProgressView.angle, toAngle: 0, duration: 0.5, completion: nil)
//    }
  
}



