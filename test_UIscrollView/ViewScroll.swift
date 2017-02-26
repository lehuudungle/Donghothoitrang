//
//  ViewScroll.swift
//  test_UIscrollView
//
//  Created by Admin on 11/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var pageCotroller: UIPageControl!
    var pageImages: [String] = []
    var first = false
    var photo: [UIImageView] = []
    var fontScrollViews: [UIScrollView] = []
    var currentPage: Int!
    var widthImg: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("currntPage: \(currentPage)")
        pageCotroller.currentPage = currentPage
        
        print("gia tri trang \(pageCotroller.currentPage)")
        pageCotroller.numberOfPages = pageImages.count
        ScrollView.minimumZoomScale = 0.5
        ScrollView.maximumZoomScale = 2
        
        
    }
    override func viewDidLayoutSubviews() {
        if(!first){
            first = true
            let pagesScrollViewSize =  ScrollView.frame.size
            ScrollView.contentSize = CGSizeMake(pagesScrollViewSize.width * CGFloat(pageImages.count), 0)
            ScrollView.contentOffset = CGPointMake(CGFloat(currentPage) * ScrollView.frame.size.width, 0)
            
            for( var i = 0; i <  pageImages.count; i++){
                let imgView = UIImageView(image: UIImage(named: pageImages[i] + ".jpg"))
                
                imgView.frame = CGRectMake(0, 0, ScrollView.frame.size.width, ScrollView.frame.size.height)
                print("Scroll View: \(ScrollView.frame.size.width)")
                widthImg = ScrollView.frame.size.width  // lay do dai anh de tinh pagecontroller
                imgView.contentMode = .ScaleAspectFit
                imgView.userInteractionEnabled = true  // tuong tac giao dien voi no
                imgView.multipleTouchEnabled = true   // tuong tac da diem , co the double tap cho no
                let tap  = UITapGestureRecognizer(target: self, action: Selector("tapImg:"))
                tap.numberOfTapsRequired = 1
                imgView.addGestureRecognizer(tap)
                let doubleTap = UITapGestureRecognizer(target: self, action: Selector("doubleTabImg:"))
                doubleTap.numberOfTapsRequired = 2
                tap.requireGestureRecognizerToFail(doubleTap)
                imgView.addGestureRecognizer(doubleTap)
                
                    photo.append(imgView)
                
                
                let fontScrollView =  UIScrollView(frame: CGRectMake(CGFloat(i) * ScrollView.frame.size.width, 0, ScrollView.frame.size.width, ScrollView.frame.size.height))
                fontScrollView.minimumZoomScale = 1
                fontScrollView.maximumZoomScale = 2
                fontScrollView.delegate = self
                fontScrollView.addSubview(imgView)
                fontScrollViews.append(fontScrollView)
                self.ScrollView.addSubview(fontScrollView)
            }
            

        }
//        print(" do doi\(ScrollView.contentOffset.x)")
    }
   

   
    @IBAction func action_Page(sender: AnyObject) {
        print("page: \(pageCotroller.currentPage)")
        ScrollView.contentOffset = CGPointMake(CGFloat(pageCotroller.currentPage) * ScrollView.frame.size.width, 0)
//        print(" do doi\(ScrollView.contentOffset.x)")
        
    }
     func scrollViewDidScroll(scrollView: UIScrollView) {
        
        widthImg = ScrollView.frame.width
        pageCotroller.currentPage = Int(scrollView.contentOffset.x / widthImg)
        
    }
    func viewForZoomingInScrollView(scollView: UIScrollView)->UIView?{
        return photo[pageCotroller.currentPage]
    }
    func tapImg(gesture: UITapGestureRecognizer ){
        let position = gesture.locationInView(photo[pageCotroller.currentPage])
        zoomRectForScale(fontScrollViews[pageCotroller.currentPage].zoomScale * 1.5,center: position)
    }
    func doubleTabImg(gesture: UITapGestureRecognizer){
        let position = gesture.locationInView(photo[pageCotroller.currentPage])
        zoomRectForScale(fontScrollViews[pageCotroller.currentPage].zoomScale * -1.5, center: position)
    }
    func zoomRectForScale(scale: CGFloat, center: CGPoint){
        var zoomRect = CGRect()
        let scrollViewSize = ScrollView.bounds.size
        zoomRect.size.height = scrollViewSize.height / scale
        zoomRect.size.width = scrollViewSize.width / scale
        zoomRect.origin.x = center.x - (zoomRect.size.width / 2.0)
        zoomRect.origin.y = center.y - (zoomRect.size.height / 2.0)
        print(zoomRect)
        fontScrollViews[pageCotroller.currentPage].zoomToRect(zoomRect, animated: true)
    }

    
    
    


}
