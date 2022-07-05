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
    
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    
    let viewmodel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
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
    
    func prepareAnimation(){
        nameLabelCenterX.constant = view.bounds.width
        bountyLabelCenterX.constant = view.bounds.width
    }
    
    func showAnimation(){
        nameLabelCenterX.constant=0
        bountyLabelCenterX.constant=0

        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        UIView.transition(with: photoImage, duration: 0.3, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
}

class DetailViewModel{
    var bountyInfo:BountyInfo?
    
    func update(model:BountyInfo){
        bountyInfo=model
    }
}
