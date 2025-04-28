//
//  SelectOnboardingViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class SelectOnboardingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [HouseSearchStatus] = [HouseSearchStatus]()
    var imageArray = ["homeicon","homemateicon"]
    var selectedState: [Bool] = []
    var selectedStatus: HouseSearchStatus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.lookingForAPlace, .needAHousemate]
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

extension SelectOnboardingViewController: UITableViewDelegate, UITableViewDataSource {
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
            print("Selected status: \(status.rawValue)")
        }
        tableView.reloadData()
    }
}
