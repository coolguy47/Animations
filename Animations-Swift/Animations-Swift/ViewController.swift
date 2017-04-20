//
//  ViewController.swift
//  Animations-Swift
//
//  Created by Jeremiah on 18/04/17.
//  Copyright © 2017 Jeremiah. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewToAnimate: UIView!
    var arrayAnimations = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        let animations = Animations()
        animations.gyroAnimation(view: viewToAnimate)
        arrayAnimations = ["Left","Right","Up","Down", "Rotate", "ScaleByHalf","ScaleByDouble","KeyFrameAnimation","Shake","easeInOut","easeIn","Squeeze"]
    
    }
//MARK: CollectionView DataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayAnimations.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
       // var cell = CustomCollectionCell()
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionCell
        cell.labelTitle.text = arrayAnimations[indexPath.row]
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let size: CGSize = arrayAnimations[indexPath.row].size(attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 17.0)])
        return CGSize(width: size.width+20 , height: collectionView.bounds.size.height)
       
    }
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        if arrayAnimations[indexPath.row] == "Left" {
            let animations = Animations()
            animations.doLeftAnimation(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Right" {
            let animations = Animations()
            animations.doRightAnimation(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Up" {
            let animations = Animations()
            animations.doUpAnimation(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Down" {
            let animations = Animations()
            animations.doDownAnimation(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Rotate" {
            let animations = Animations()
            animations.doRotate(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "ScaleByHalf" {
            let animations = Animations()
            animations.doScaleByHalf(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "ScaleByDouble" {
            let animations = Animations()
            animations.doScaleByDouble(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "KeyFrameAnimation" {
            let animations = Animations()
            animations.animateUsingKeyFrame(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Shake" {
            let animations = Animations()
            animations.shakeIt(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "easeIn" {
            let animations = Animations()
            animations.easeIn(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "easeInOut" {
            let animations = Animations()
            animations.easeInOut(view: viewToAnimate)
        }
        else if arrayAnimations[indexPath.row] == "Squeeze" {
            let animations = Animations()
            animations.squeeze(view: viewToAnimate)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

