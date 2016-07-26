//
//  ViewController.swift
//  CheckControl
//
//  Created by 孟辉 on 16/7/25.
//  Copyright © 2016年 孟辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let checkControl = CheckControl(frame: CGRectMake(50,50,50,50))
        
        checkControl.selected = false
        //checkControl.lineWith = 10
        checkControl.isRoundBorder = false
        checkControl.addTarget(self, action: #selector(ViewController.checkControl(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(checkControl)
    }
    func checkControl(sender:AnyObject) {
        guard  let control = sender as? CheckControl else {
        return
        }
        control.selected = !control.selected
        if control.selected{
            control.check()
        }else{
            control.dissmiss()
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

