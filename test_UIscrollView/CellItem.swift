//
//  CellItem.swift
//  test_UIscrollView
//
//  Created by Admin on 2/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

class CellItem: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var imageView: UIImageView!
    var price: UILabel!
    var kpriceLabelHeight: CGFloat = 30
    var kCellWith: CGFloat = 100
    var kLabelHeight: CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {//phương thưc này chắc chắn các thuộc tính của super class có giá trị
        super.init(coder: aDecoder)
    }
    
    func addSubViews(checkAddAll: Bool){
        if(imageView == nil){
            imageView = UIImageView(frame: CGRectMake(0, 0, kCellWith, kCellWith))
            imageView.layer.borderColor = tintColor.CGColor
            imageView.contentMode = .ScaleAspectFit
            contentView.addSubview(imageView)
        }
        if(checkAddAll){
        if(nameLabel == nil){
            nameLabel = UILabel(frame: CGRectMake(0,kCellWith,kCellWith,kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor =   UIColor(white: 0.9, alpha: 1)
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.systemFontOfSize(10)
            nameLabel.numberOfLines = 2
            contentView.addSubview(nameLabel)
        }
        if(price == nil){
            price = UILabel(frame: CGRectMake(0,kCellWith + kLabelHeight, kCellWith,kpriceLabelHeight))
            price.textAlignment = .Left
            price.textColor = UIColor(red: 255/255, green: 116/255, blue: 35/255, alpha: 1)
            price.font = UIFont.boldSystemFontOfSize(12)
            contentView.addSubview(price)
        }
        }
        
    }
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth     = selected ? 2 : 0 // nếu đúng thì chon là 2 còn ko đúng là 0
            
        }
    }
    

}
