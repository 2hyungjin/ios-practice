//
//  ViewController.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/29.
//

import UIKit

class ViewController: UIViewController {
    let viewmodel:BountyViewModel = BountyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let destination = segue.destination as? DetailViewController{
                if let index = sender as? Int{
                    destination.viewmodel.update(model: viewmodel.bountyInfo(at: index))
                }
            }
        }
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.numOfBountyInfo
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BountyTableViewCell else{
            return UITableViewCell()
        }
        
        let bountiInfo:BountyInfo = viewmodel.bountyInfo(at: indexPath.row)
        cell.nameLabel.text = bountiInfo.name
        cell.bountyLabel.text = String(bountiInfo.bounty)
        cell.photoImage.image = bountiInfo.image
        return cell
    }
}

