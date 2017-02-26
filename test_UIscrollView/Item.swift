//
//  Item.swift
//  test_UIscrollView
//
//  Created by Admin on 2/22/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
class Item: NSObject{
    var name: String?
    var content: String?
    var nameImages: [String] = []
    var price: String?
    init(name: String, content: String,nameImages: [String],price: String) {
        self.name = name
        self.content = content
        self.nameImages = nameImages
        self.price = price
    }
}
