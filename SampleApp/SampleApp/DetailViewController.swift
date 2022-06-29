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
    
    var name:String?
    var bounty:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI(){
        if let name = self.name, let bounty = self.bounty{
            photoImage.image = UIImage(named: "\(name).jpg")
            nameLabel.text = name
            bountyLabel.text = String(bounty)
        }
        
    }
    @IBAction func touchUpCloseButton(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
 
}
