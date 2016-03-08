//
//  ViewController.swift
//  无线滚动广告栏
//
//  Created by 高明 on 16/3/4.
//  Copyright © 2016年 高明. All rights reserved.
//

import UIKit

class InfinitelyScrollView: UIView, UIScrollViewDelegate{
    let imageArray = NSMutableArray()
    let page = UIPageControl(frame: CGRectMake(275, 160, 100, 40))
    var timer = NSTimer.init()
    let scroll = UIScrollView.init()
    override init(frame: CGRect) {
        
    
        super.init(frame: frame)
        scroll.backgroundColor = UIColor.redColor()
//        设置scroll的属性
        let contentView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 200))
        self.addSubview(contentView)
        
        scroll.frame = contentView.bounds
        contentView.addSubview(scroll)
        scroll.contentSize = CGSizeMake(scroll.bounds.width * 3, 0);
        scroll.showsHorizontalScrollIndicator = false;
        scroll.showsVerticalScrollIndicator = false;
        scroll.pagingEnabled = true;
        scroll.bounces = false
        //        设置scroll里面的子控件
        let count = 3
        var a: CGFloat = 0
        
        for i in 0..<count {
            let imageV = UIImageView(frame: CGRectMake(a, 0, scroll.bounds.width, scroll.bounds.height))
            a += scroll.bounds.width
            imageV.backgroundColor = UIColor.yellowColor()
            scroll.addSubview(imageV)
            imageV.tag = i
            
            let guest = UITapGestureRecognizer(target: self, action: "imageDidClick:")
            imageV.addGestureRecognizer(guest)
            
        }
        scroll.delegate = self
        
        //pageView
        page.numberOfPages = 5
        page.backgroundColor = UIColor.blueColor()
        contentView.addSubview(page)
       endStatic()
       starTimer()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    点击图片做出反应
    func imageDidClick(ss: UIGestureRecognizer){
        print("\(ss.view)")
    }
    
//      MARK - 设置状态
    func endStatic(){
        
        for (index, imageV) in scroll.subviews.enumerate() {
            var imgIndex = 0
            if index == 0{
            guard let ss: UIImageView = imageV as? UIImageView else
            {
                return;
            }
                
                imgIndex = page.currentPage - 1
                if imgIndex == -1 {
                imgIndex = page.numberOfPages - 1
                }
                ss.image = UIImage(named: "InfinitelyScrollView.bundle/0\(imgIndex)")
                ss.tag = imgIndex
            }
            
            if index == 1{
                guard let ss: UIImageView = imageV as? UIImageView else
                {
                    return;
                }
                imgIndex = page.currentPage
                ss.image = UIImage(named: "InfinitelyScrollView.bundle/0\(imgIndex)")
                ss.tag = imgIndex

            }
            
            
            if index == 2{
                guard let ss: UIImageView = imageV as? UIImageView else
                {
                    return;
                }
                imgIndex = page.currentPage + 1
                if imgIndex == page.numberOfPages  {
                    imgIndex = 0                }
                ss.image = UIImage(named: "InfinitelyScrollView.bundle0\(imgIndex)")
                ss.tag = imgIndex

            }
    
    }
        scroll.contentOffset.x = scroll.bounds.width
    }
    
  
    func scrollViewDidScroll(scrollView: UIScrollView) {
       let offsetX = scrollView.contentOffset.x
        var temp: CGFloat = 3000
        var indexTemp: Int?
        for (index, imageV) in scroll.subviews.enumerate(){
            let margin = fabs(offsetX - imageV.frame.minX)
            if temp > margin {
            temp = margin
            indexTemp = imageV.tag
            
            }
        page.currentPage = indexTemp!
        }
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        endStatic()
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        timer.invalidate()
    }

    func starTimer(){
 timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "changePage", userInfo: nil, repeats: true)
    NSRunLoop.currentRunLoop().addTimer(timer, forMode: NSRunLoopCommonModes)

    }
    func changePage(){
        var offsetx = scroll.contentOffset.x
        offsetx += self.scroll.bounds.width

        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.scroll.contentOffset = CGPointMake(offsetx, 0)
            }) { ( yy:Bool ) -> Void in
                self.endStatic()
        }
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        starTimer()
    }
    
}

