//
//  Animations.swift
//  Animations-Swift
//
//  Created by Jeremiah on 18/04/17.
//  Copyright © 2017 Jeremiah. All rights reserved.
//

import UIKit
import CoreMotion
class Animations: NSObject {
    
    func doLeftAnimation(view:UIView)  {
        
        UIView.animate(withDuration: 1.0) { 
            var frame : CGRect = view.frame
            
            frame.origin.x = 0
            view.frame = frame
        }
        
    }
    
    func doRightAnimation(view : UIView) {
         UIView.animate(withDuration: 1.0) {
        var frame : CGRect = view.frame
        
        frame.origin.x += 100
        view.frame = frame
        }
    }
    func doUpAnimation(view : UIView) {
        UIView.animate(withDuration: 1.0) {
            var frame : CGRect = view.frame
            
            frame.origin.y -= 100
            view.frame = frame
        }
    }
    func doDownAnimation(view : UIView) {
        UIView.animate(withDuration: 1.0) {
            var frame : CGRect = view.frame
            
            frame.origin.y += 100
            view.frame = frame
        }
    }
    
    //Corner radius
    func doRotate(view: UIView){
//        UIView.animate(withDuration: 1.0, delay: 0.5, options: .curveEaseIn, animations: {
//            view.layer.cornerRadius = 50.0
//        }, completion: nil)
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.66, initialSpringVelocity: 0.0, options: [], animations: {
           // view.layer.cornerRadius = view.frame.size.width/2
            view.transform = view.transform.rotated(
                by:.pi/2)
        }, completion: nil)
    }
    
    func doScaleByHalf(view: UIView){
        
        let scaleTransform = view.transform.scaledBy(x: 0.5, y: 0.5)

        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.33, initialSpringVelocity: 0.0, options: [], animations: {
    view.transform = scaleTransform
        
        })

    }
    func doScaleByDouble(view: UIView){
        
        let scaleTransform = view.transform.scaledBy(x: 2, y: 2)
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.33, initialSpringVelocity: 0.0, options: [], animations: {
            view.transform = scaleTransform
            
        })
        
    }
    func animateUsingKeyFrame(view: UIView){
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.y"
        animation.values = [0,200,0]
        animation.keyTimes = [0, 0.5,1]
        animation.duration = 2
        animation.isAdditive = true
        view.layer.add(animation, forKey: "hello")
    }
    
    func shakeIt(view: UIView){
        let shakeAnimation = CAKeyframeAnimation()
        shakeAnimation.keyPath = "position.x"
        shakeAnimation.values = [0,-10,10,-10,5,-5,5,0]
        shakeAnimation.keyTimes = [0,0.125,0.25,0.375, 0.5, 0.625, 0.75, 0.875, 1]
        shakeAnimation.duration = 0.5
        shakeAnimation.isAdditive = true
        view.layer.add(shakeAnimation, forKey: "shake")
         
    }
    func easeIn(view: UIView){
        view.transform = view.transform.scaledBy(x: 0, y: 0)
        let timingFunction = CAMediaTimingFunction(controlPoints: 5/6 , 0.2 , 2/6 , 0.9)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timingFunction)
        UIView.animate(withDuration: 1.0) { 
            view.transform = CGAffineTransform.identity
        }
        CATransaction.commit()
        
    }
    func easeInOut(view : UIView){
        view.transform = view.transform.scaledBy(x: 0, y: 0)
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: .calculationModeCubic, animations: { 
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: { 
                view.transform = CGAffineTransform.identity
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                view.transform = view.transform.scaledBy(x: 0, y: 0)
            })
        }, completion: nil)
        
    }
    
    func gyroAnimation(view :UIView){
        
       let manger = CMMotionManager()
//        if gyro.isGyroAvailable{
//            gyro.startGyroUpdates()
//            
//        }
        if manger.isAccelerometerAvailable{
            manger.accelerometerUpdateInterval = 0.01
            manger.startAccelerometerUpdates(to: .main) {
                 (data: CMAccelerometerData?, error: Error?) in
                if let acceleration = data?.acceleration {
                    let rotation = atan2(acceleration.x, acceleration.y) - .pi
                    view.transform = CGAffineTransform(rotationAngle: CGFloat(rotation))
                }
            
            }
        }
    }
    
    func squeeze (view : UIView){
        let squeezeX = CAKeyframeAnimation()
        squeezeX.keyPath = "transform.scale.x"
               squeezeX.values = [1, 1.5*0.2, 0.5, 1.5*0.2, 1]
        squeezeX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
       
        squeezeX.duration = 0.5
      
        squeezeX.beginTime = CACurrentMediaTime() + CFTimeInterval(0.0)
        view.layer.add(squeezeX, forKey: "squeezeX")
        
        let squeezeY = CAKeyframeAnimation()
        squeezeY.keyPath = "transform.scale.y"
        squeezeY.values = [1, 1.1, 1, 1.1, 1]
        squeezeY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        
        squeezeY.duration = 0.5
               squeezeY.beginTime = CACurrentMediaTime() + CFTimeInterval(0.001)
        view.layer.add(squeezeY, forKey: "squeezeY")

    }
    
    

}
