//
//  ViewHomeViewController.swift
//  test_UIscrollView
//
//  Created by Admin on 2/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class ViewHome: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    
    var items: [Item] = []

    @IBOutlet weak var myCollection: UICollectionView!
    override func viewDidLoad() {
        print("goi den day")
        super.viewDidLoad()
        
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("items", ofType: "plist"){
            
            myDict = NSDictionary(contentsOfFile: path)
        
       
    }
        
        for dic in myDict!.allValues{
            
            items.append(Item(name: dic["name"] as! String, content: dic["content"] as! String, nameImages: dic["images"] as! NSArray as! [String], price: dic["price"] as! String))
            
        }
        
        print("goi den view home")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CellItem
        cell.addSubViews(true)
        cell.imageView.image = UIImage(named: items[indexPath.item].nameImages[0]+".jpg")
        cell.nameLabel.text = items[indexPath.item].name
        cell.price.text = items[indexPath.item].price
//        let img = UIImageView(image: UIImage(named: items[indexPath.item].nameImages[0]+".jpg"))
//        img.frame = CGRectMake(0, 0, 100, 100)
//        img.contentMode = .ScaleAspectFit
//        cell.addSubview(img)
//        cell.contentView.addSubview(img)
        return cell
    }
    
    // phương thức này thuộc lớp delegate bắt sự kiện khi click vào collectionView
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let listView = self.storyboard?.instantiateViewControllerWithIdentifier("ViewDetailShop") as? ListImage
        listView?.item = items[indexPath.item]// chú ý nó sẽ  chạy viewDidload trước khi hiển thị
        self.navigationController?.pushViewController(listView!, animated: true)
    }

    
    

}
