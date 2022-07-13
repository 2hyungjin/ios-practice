//
//  ViewController.swift
//  NetworkApplication
//
//  Created by 이형진 on 2022/07/12.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchFilterSegment: UISegmentedControl!
    
    var keyboardDismissTapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: nil, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchButton.layer.cornerRadius = 10
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.delegate = self
        
        self.keyboardDismissTapGesture.delegate = self
        self.view.addGestureRecognizer(keyboardDismissTapGesture)
        
    }
    
    func navigate(){
        switch searchFilterSegment.selectedSegmentIndex{
        case 0:
            self.performSegue(withIdentifier: "toPhotoCollectionVC", sender: nil)
        case 1:
            self.performSegue(withIdentifier: "toUserListVC", sender: nil)
        default:
            self.performSegue(withIdentifier: "toPhotoCollectionVC", sender: nil)
        }
    }
    
    @IBAction func onSearchButtonClicked(_ sender: UIButton) {
        if searchBar.text?.count ?? 0 > 0{
            navigate()
        }
    }
    
    @IBAction func searchFilterValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            searchBar.placeholder = "사진 키워드"
        case 1:
            searchBar.placeholder = "사용자 이름"
        default:
            searchBar.placeholder = "사진 키워드"
        }
        
        self.searchBar.becomeFirstResponder()
    }
}

extension HomeVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchButton.isHidden = searchText.isEmpty
    }
}

extension HomeVC : UIGestureRecognizerDelegate{
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //뷰가 터치 됐을 때
        return true
    }
}

