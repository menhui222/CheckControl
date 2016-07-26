
//
//  CheckControl.swift
//  ImageTextButton
//
//  Created by 孟辉 on 16/7/22.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import Foundation
import UIKit

class CheckControl: UIControl {

    //线的宽度
    var lineWith:CGFloat = 2.0
    //颜色
    var lineColor = UIColor(red: 0.078, green: 0.196, blue: 0.314, alpha: 1.000)
    //是否有外圆边框
    var isRoundBorder :Bool = true
    
    lazy var lineLayer:CAShapeLayer = {
        let ret = CAShapeLayer()
        ret.strokeColor = self.lineColor.CGColor;
        ret.fillColor = UIColor.clearColor().CGColor;
        ret.lineCap = kCALineCapRound;
        ret.lineJoin = kCALineJoinRound;
        ret.lineWidth = self.lineWith;
        ret.path = self.checkmarkPath().CGPath;
        return ret;
        
    }()
    func check(){
        //lineLayer = self.checkmarkLayerWithColor()
        self.layer.addSublayer(self.lineLayer)
        lineLayer.strokeStart = 0;
        lineLayer.strokeEnd = 0;
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.lineLayer.strokeStart = 0.0;
            self.lineLayer.strokeEnd = 1.0;
        }
        
        CATransaction.commit()
    }
    func dissmiss(){
    
        CATransaction.begin();
        CATransaction.setCompletionBlock {
            self.lineLayer.strokeStart = 0.0;
            self.lineLayer.strokeEnd = 0.0;
        }
        
        CATransaction.commit();
    }

    /**
     可以画的有效区域
     
     - returns: CGRect
     */
    func insetRect() ->CGRect{
        var ret = self.bounds
        ret = CGRectInset(ret, 2 * lineWith , 2 * lineWith)
        return ret
    }
    /**
     外切圆半径
     
     - returns: CGFloat
     */
    func outerRadius() ->CGFloat{
        
        return sqrt(pow(self.insetRect().size.width, 2) + pow(self.insetRect().size.height, 2)) / 2;
    }
    /**
        内切圆半径
     - returns: CGFloat
     */
    func innerRadius() -> CGFloat{
        return min(self.insetRect().size.width, self.insetRect().size.height) / 2
    }
    /**
     获取中心即圆心
     
     - returns: CGPoint
     */
    func bounsCenter() -> CGPoint{
        
        return CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
    }
  
    
    
    /**
     钩号起始点
     
     - returns: CGPoint
     */
    func startPoint() -> CGPoint{
        let angle:Double = 13 * M_PI / 12
        return CGPointMake(self.bounsCenter().x + self.innerRadius() * CGFloat(cos(angle)),self.bounsCenter().y + self.innerRadius() * CGFloat(sin(angle)))
    }
    /**
     钩号中间转折点
     
     - returns: CGPoint
     */
    func middlePoint() -> CGPoint {
        return CGPointMake(self.bounsCenter().x - self.innerRadius() * 0.25, self.bounsCenter().y + self.innerRadius() * 0.8)
    }
    /**
     钩号终止点
     
     - returns: CGPoint
     */
    func endPoint() -> CGPoint {
        let  angle: Double = 3*M_PI/2 + M_PI*3/10
        return CGPointMake(self.bounsCenter().x + self.outerRadius() * CGFloat(cos(angle)), self.bounsCenter().y + self.outerRadius() * CGFloat(sin(angle)));
    }
    func checkmarkPath()-> UIBezierPath{
        let  path = UIBezierPath()
        path.moveToPoint(self.startPoint())
        path.addLineToPoint(self.middlePoint())
        path.addLineToPoint(self.endPoint())
        if self.isRoundBorder{
            let  angle: Double = 3*M_PI/2 + M_PI*3/10
            path.addArcWithCenter(self.bounsCenter(), radius: self.outerRadius(), startAngle:CGFloat(angle) , endAngle: CGFloat(2*M_PI)+CGFloat(angle), clockwise: true)
        }
        return path;
    
    
    
    }
    
    
}



