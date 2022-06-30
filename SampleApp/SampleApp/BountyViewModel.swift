//
//  BountyViewModel.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/30.
//

import Foundation
class BountyViewModel{
    let bountyInfoList:[BountyInfo]=[
        BountyInfo(name: "brook", bounty: 30000),
        BountyInfo(name: "chopper", bounty: 300),
        BountyInfo(name: "franky", bounty: 40000),
        BountyInfo(name: "luffy", bounty: 330000),
        BountyInfo(name: "nami", bounty: 5000),
        BountyInfo(name: "robin", bounty: 10000),
        BountyInfo(name: "sanji", bounty: 130000),
        BountyInfo(name: "zoro", bounty: 230000),
    ]
    var numOfBountyInfo:Int {
        return bountyInfoList.count
    }
    
    func bountyInfo(at index:Int)->BountyInfo{
        bountyInfoList[index]
    }
    
}
