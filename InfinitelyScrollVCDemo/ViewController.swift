//
//  Controller.swift
//  无线滚动广告栏
//
//  Created by 高明 on 16/3/8.
//  Copyright © 2016年 高明. All rights reserved.
//

import UIKit

class ViewContrller: UIViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let scroll = InfinitelyScrollView.init()
        scroll.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 300)
        scroll.backgroundColor = UIColor.redColor()
        self.view.addSubview(scroll)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
