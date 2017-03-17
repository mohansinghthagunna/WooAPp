//
//  CustomBurgerMenuAnimationView.swift
//
//  Code generated using QuartzCode 1.55.0 on 3/17/17.
//  www.quartzcodeapp.com
//

import UIKit


class CustomBurgerMenuAnimationView: UIView, CAAnimationDelegate {
    
    var layers : Dictionary<String, AnyObject> = [:]
    var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
    var updateLayerValueForCompletedAnimation : Bool = true
    
    var mainColor : UIColor!
    
    //MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProperties()
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupProperties()
        setupLayers()
    }
    
    
    
    func setupProperties(){
        self.mainColor = UIColor(red:0.267, green: 0.267, blue:0.267, alpha:1)
    }
    
    func setupLayers(){
        self.backgroundColor = UIColor(red:1, green: 1, blue:1, alpha:0)
        
        let Group = CALayer()
        Group.frame = CGRect(x: 9.64, y: 20.42, width: 30.73, height: 2.22)
        
        self.layer.addSublayer(Group)
        layers["Group"] = Group
        let top = CAShapeLayer()
        top.frame       = CGRect(x: 0.36, y: 0, width: 30, height: 1)
        top.setValue(-45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
        top.lineCap     = kCALineCapRound
        top.lineJoin    = kCALineJoinRound
        top.fillColor   = nil
        top.strokeColor = self.mainColor.cgColor
        top.lineWidth   = 7
        top.path        = topPath().cgPath
        Group.addSublayer(top)
        layers["top"] = top
        let bottom = CAShapeLayer()
        bottom.frame       = CGRect(x: -0, y: 0.53, width: 30.73, height: 0.98)
        bottom.setValue(45 * CGFloat(M_PI)/180, forKeyPath:"transform.rotation")
        bottom.lineCap     = kCALineCapRound
        bottom.lineJoin    = kCALineJoinRound
        bottom.fillColor   = nil
        bottom.strokeColor = self.mainColor.cgColor
        bottom.lineWidth   = 7
        bottom.path        = bottomPath().cgPath
        Group.addSublayer(bottom)
        layers["bottom"] = bottom
        let middle = CAShapeLayer()
        middle.anchorPoint = CGPoint(x: 0, y: 0)
        middle.frame       = CGRect(x: 0.36, y: 1.58, width: 30, height: 0.64)
        middle.lineCap     = kCALineCapRound
        middle.lineJoin    = kCALineJoinRound
        middle.fillColor   = nil
        middle.strokeColor = self.mainColor.cgColor
        middle.lineWidth   = 7
        middle.path        = middlePath().cgPath
        Group.addSublayer(middle)
        layers["middle"] = middle
    }
    
    
    
    //MARK: - Animation Setup
    
    func addCrossToBurgerAnimation(reverseAnimation: Bool = false, totalDuration: CFTimeInterval = 0.496, endTime: CFTimeInterval = 1, completionBlock: ((_ finished: Bool) -> Void)? = nil){
        let endTime = endTime * totalDuration
        
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = endTime
            completionAnim.delegate = self
            completionAnim.setValue("CrossToBurger", forKey:"animId")
            completionAnim.setValue(true, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"CrossToBurger")
            if let anim = layer.animation(forKey: "CrossToBurger"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : String = reverseAnimation ? kCAFillModeBoth : kCAFillModeForwards
        
        ////Top animation
        let topTransformAnim            = CABasicAnimation(keyPath:"transform")
        topTransformAnim.fromValue      = NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1));
        topTransformAnim.toValue        = NSValue(caTransform3D: CATransform3DMakeTranslation(0, -10, 0));
        topTransformAnim.duration       = 0.999 * totalDuration
        topTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.1, 0.65, 1.37)
        
        var topCrossToBurgerAnim : CAAnimationGroup = QCMethod.group(animations: [topTransformAnim], fillMode:fillMode)
        if (reverseAnimation){ topCrossToBurgerAnim = QCMethod.reverseAnimation(anim: topCrossToBurgerAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["top"]?.add(topCrossToBurgerAnim, forKey:"topCrossToBurgerAnim")
        
        ////Bottom animation
        let bottomTransformAnim            = CABasicAnimation(keyPath:"transform")
        bottomTransformAnim.fromValue      = NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1));
        bottomTransformAnim.toValue        = NSValue(caTransform3D: CATransform3DMakeTranslation(0, 12, 0));
        bottomTransformAnim.duration       = 0.999 * totalDuration
        bottomTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.1, 0.65, 1.37)
        
        var bottomCrossToBurgerAnim : CAAnimationGroup = QCMethod.group(animations: [bottomTransformAnim], fillMode:fillMode)
        if (reverseAnimation){ bottomCrossToBurgerAnim = QCMethod.reverseAnimation(anim: bottomCrossToBurgerAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["bottom"]?.add(bottomCrossToBurgerAnim, forKey:"bottomCrossToBurgerAnim")
        
        ////Middle animation
        let middleLineWidthAnim      = CAKeyframeAnimation(keyPath:"lineWidth")
        middleLineWidthAnim.values   = [0, 7]
        middleLineWidthAnim.keyTimes = [0, 1]
        middleLineWidthAnim.duration = 0.999 * totalDuration
        
        var middleCrossToBurgerAnim : CAAnimationGroup = QCMethod.group(animations: [middleLineWidthAnim], fillMode:fillMode)
        if (reverseAnimation){ middleCrossToBurgerAnim = QCMethod.reverseAnimation(anim: middleCrossToBurgerAnim, totalDuration:totalDuration) as! CAAnimationGroup}
        layers["middle"]?.add(middleCrossToBurgerAnim, forKey:"middleCrossToBurgerAnim")
    }
    
    func addBurgerToCrossAnimation(completionBlock: ((_ finished: Bool) -> Void)? = nil){
        if completionBlock != nil{
            let completionAnim = CABasicAnimation(keyPath:"completionAnim")
            completionAnim.duration = 0.498
            completionAnim.delegate = self
            completionAnim.setValue("BurgerToCross", forKey:"animId")
            completionAnim.setValue(false, forKey:"needEndAnim")
            layer.add(completionAnim, forKey:"BurgerToCross")
            if let anim = layer.animation(forKey: "BurgerToCross"){
                completionBlocks[anim] = completionBlock
            }
        }
        
        let fillMode : String = kCAFillModeForwards
        
        ////Top animation
        let topTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        topTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)),
                                           NSValue(caTransform3D: CATransform3DMakeTranslation(0, -10, 0)),
                                           NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1))]
        topTransformAnim.keyTimes       = [0, 0.000876, 1]
        topTransformAnim.duration       = 0.497
        topTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.1, 0.65, 1.37)
        
        let topBurgerToCrossAnim : CAAnimationGroup = QCMethod.group(animations: [topTransformAnim], fillMode:fillMode)
        layers["top"]?.add(topBurgerToCrossAnim, forKey:"topBurgerToCrossAnim")
        
        ////Bottom animation
        let bottomTransformAnim            = CAKeyframeAnimation(keyPath:"transform")
        bottomTransformAnim.values         = [NSValue(caTransform3D: CATransform3DMakeRotation(CGFloat(M_PI_4), 0, 0, -1)),
                                              NSValue(caTransform3D: CATransform3DMakeTranslation(0, 12, 0)),
                                              NSValue(caTransform3D: CATransform3DMakeRotation(-45 * CGFloat(M_PI/180), 0, 0, -1))]
        bottomTransformAnim.keyTimes       = [0, 0.000876, 1]
        bottomTransformAnim.duration       = 0.497
        bottomTransformAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.25, 0.1, 0.65, 1.37)
        
        let bottomBurgerToCrossAnim : CAAnimationGroup = QCMethod.group(animations: [bottomTransformAnim], fillMode:fillMode)
        layers["bottom"]?.add(bottomBurgerToCrossAnim, forKey:"bottomBurgerToCrossAnim")
        
        ////Middle animation
        let middleLineWidthAnim      = CAKeyframeAnimation(keyPath:"lineWidth")
        middleLineWidthAnim.values   = [0, 7, 0]
        middleLineWidthAnim.keyTimes = [0, 2.52E-05, 1]
        middleLineWidthAnim.duration = 0.497
        
        let middleBurgerToCrossAnim : CAAnimationGroup = QCMethod.group(animations: [middleLineWidthAnim], fillMode:fillMode)
        layers["middle"]?.add(middleBurgerToCrossAnim, forKey:"middleBurgerToCrossAnim")
    }
    
    //MARK: - Animation Cleanup
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool){
        if let completionBlock = completionBlocks[anim]{
            completionBlocks.removeValue(forKey: anim)
            if (flag && updateLayerValueForCompletedAnimation) || anim.value(forKey: "needEndAnim") as! Bool{
                updateLayerValues(forAnimationId: anim.value(forKey: "animId") as! String)
                removeAnimations(forAnimationId: anim.value(forKey: "animId") as! String)
            }
            completionBlock(flag)
        }
    }
    
    func updateLayerValues(forAnimationId identifier: String){
        if identifier == "CrossToBurger"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["top"] as! CALayer).animation(forKey: "topCrossToBurgerAnim"), theLayer:(layers["top"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["bottom"] as! CALayer).animation(forKey: "bottomCrossToBurgerAnim"), theLayer:(layers["bottom"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["middle"] as! CALayer).animation(forKey: "middleCrossToBurgerAnim"), theLayer:(layers["middle"] as! CALayer))
        }
        else if identifier == "BurgerToCross"{
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["top"] as! CALayer).animation(forKey: "topBurgerToCrossAnim"), theLayer:(layers["top"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["bottom"] as! CALayer).animation(forKey: "bottomBurgerToCrossAnim"), theLayer:(layers["bottom"] as! CALayer))
            QCMethod.updateValueFromPresentationLayer(forAnimation: (layers["middle"] as! CALayer).animation(forKey: "middleBurgerToCrossAnim"), theLayer:(layers["middle"] as! CALayer))
        }
    }
    
    func removeAnimations(forAnimationId identifier: String){
        if identifier == "CrossToBurger"{
            (layers["top"] as! CALayer).removeAnimation(forKey: "topCrossToBurgerAnim")
            (layers["bottom"] as! CALayer).removeAnimation(forKey: "bottomCrossToBurgerAnim")
            (layers["middle"] as! CALayer).removeAnimation(forKey: "middleCrossToBurgerAnim")
        }
        else if identifier == "BurgerToCross"{
            (layers["top"] as! CALayer).removeAnimation(forKey: "topBurgerToCrossAnim")
            (layers["bottom"] as! CALayer).removeAnimation(forKey: "bottomBurgerToCrossAnim")
            (layers["middle"] as! CALayer).removeAnimation(forKey: "middleBurgerToCrossAnim")
        }
    }
    
    func removeAllAnimations(){
        for layer in layers.values{
            (layer as! CALayer).removeAllAnimations()
        }
    }
    
    //MARK: - Bezier Path
    
    func topPath() -> UIBezierPath{
        let topPath = UIBezierPath()
        topPath.move(to: CGPoint(x: 0, y: 1))
        topPath.addLine(to: CGPoint(x: 30, y: 0))
        
        return topPath
    }
    
    func bottomPath() -> UIBezierPath{
        let bottomPath = UIBezierPath()
        bottomPath.move(to: CGPoint(x: 0, y: 0.981))
        bottomPath.addLine(to: CGPoint(x: 30.729, y: 0))
        
        return bottomPath
    }
    
    func middlePath() -> UIBezierPath{
        let middlePath = UIBezierPath()
        middlePath.move(to: CGPoint(x: 0, y: 0.64))
        middlePath.addLine(to: CGPoint(x: 30, y: 0))
        
        return middlePath
    }
    
    
}
