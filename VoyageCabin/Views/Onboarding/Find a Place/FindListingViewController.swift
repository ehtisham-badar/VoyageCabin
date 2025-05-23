//
//  FindListingViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class FindListingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [ListingStatus] = [ListingStatus]()
    var imageArray = ["privateroom","entireproperty","studentaccomodation","hostfamilystay"]
    var selectedState: [Bool] = []
    var selectedStatus: ListingStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.privaterooms, .entireproperty, .studentacc, .hostfamily]
        selectedState = Array(repeating: false, count: list.count)
    }
    
    func registerNibs(){
        self.tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
        self.tableView.reloadData()
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FindListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as? SelectionTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.lblSelection.text = list[indexPath.row].rawValue
        cell.selectionIcon.image = UIImage(named: imageArray[indexPath.row])
        if selectedState[indexPath.row] {
            cell.selectUnselecticon.image = UIImage.selecticon
        } else {
            cell.selectUnselecticon.image = UIImage.unselecticon
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<selectedState.count {
            selectedState[i] = false
        }
        selectedStatus = list[indexPath.row]
        selectedState[indexPath.row] = true
        if let status = selectedStatus {
            Constants.lookingForAPlaceBody.type_of_listing = status.rawValue
            Constants.lookingForHousemate.type_of_listing = status.rawValue
        }
        tableView.reloadData()
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: FindPropertyAdViewController.self)) as? FindPropertyAdViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
