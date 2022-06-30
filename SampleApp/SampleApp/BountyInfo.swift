//
//  BountyInfo.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/30.
//

import Foundation
import UIKit
struct BountyInfo{
    let name:String
    let bounty:Int
    
    var image:UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    init(name:String, bounty:Int){
        self.name = name
        self.bounty = bounty
    }
}
