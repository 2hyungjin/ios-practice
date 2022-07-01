//
//  DetailViewController.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/29.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var bountyLabel: UILabel!
    @IBOutlet var photoImage: UIImageView!
    
    let viewmodel = DetailViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if let bountyInfo : BountyInfo = viewmodel.bountyInfo{
            photoImage.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = String(bountyInfo.bounty)

        }
    }
    @IBAction func touchUpCloseButton(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel{
    var bountyInfo:BountyInfo?
    
    func update(model:BountyInfo){
        bountyInfo=model
    }
}
