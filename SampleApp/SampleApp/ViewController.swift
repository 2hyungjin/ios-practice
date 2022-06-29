//
//  ViewController.swift
//  SampleApp
//
//  Created by 이형진 on 2022/06/29.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let bountyList : [String] = ["luffy","brook","nami","zoro","sanji"]
    let bountyDict : [String:Int] = ["luffy":30000,"brook":2000,"nami":1000,"zoro":20000,"sanji":15000]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BountyTableViewCell else{
            return UITableViewCell()
        }
        
        let name = bountyList[indexPath.row]
        cell.nameLabel.text = name
        cell.bountyLabel.text = String(bountyDict[name]!)
        cell.photoImage.image = UIImage(named: "\(name).jpg")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            if let destination = segue.destination as? DetailViewController{
                if let index = sender as? Int{
                    let name = bountyList[index]
                    destination.name = name
                    destination.bounty = bountyDict[name]
                }
            }
        }
    }

    
}

