//
//  PropertyPrefViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 11/05/2025.
//

import UIKit

class PropertyPrefViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let titleArr = ["Room furnishings", "Bathroom","Internet","Parking", "Max No of Housemates"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
    }
    
    func registerNibs() {
        tableView.register(UINib(nibName: String(describing: PropertyPreferenceTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: PropertyPreferenceTableViewCell.self))
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickNext(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PreviewScreenViewController.self)) as? PreviewScreenViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PropertyPrefViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PropertyPreferenceTableViewCell.self)) as? PropertyPreferenceTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.ageView.isHidden = false
        } else {
            cell.ageView.isHidden = true
        }
        cell.lblTitle.text = titleArr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
