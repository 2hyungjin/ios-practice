//
//  BoutyTableViewCell.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/29.
//

import UIKit

class BountyCollectionViewCell: UICollectionViewCell{
    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bountyLabel: UILabel!
    
    func update(_ bounty:BountyInfo){
        photoImage.image=bounty.image
        nameLabel.text=bounty.name
        bountyLabel.text=String(bounty.bounty)
    }
}
