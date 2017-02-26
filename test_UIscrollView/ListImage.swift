//
//  ListImage.swift
//  test_UIscrollView
//
//  Created by Admin on 11/9/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ListImage: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var nameShop: UILabel!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var contentShop: UITextView!
    
    var item: Item!
    var index: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        nameShop.text = item.name
        contentShop.text = item.content
        imgProfile.image = UIImage(named: item.nameImages[0]+".jpg")
        imgProfile.userInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: ("tapImg"))
        imgProfile.addGestureRecognizer(tap)

    }
    func tapImg(){
        
        pushView(0)
    }
    
    // delegate uicollectionView
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return item.nameImages.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        cell.kCellWith = 60
        cell.addSubViews(false)
        cell.imageView.contentMode = .ScaleAspectFit
        cell.imageView.image = UIImage(named: item.nameImages[indexPath.item]+".jpg")
        index = indexPath.item
        return cell
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       pushView(indexPath.item)
    }
    


  
    func pushView(index: Int){
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewScroll") as? ViewScroll
        listView?.pageImages = item.nameImages
        listView?.currentPage = index
        print("index: \(listView?.currentPage)")
        self.navigationController?.pushViewController(listView!, animated: true)
    }

  

}
