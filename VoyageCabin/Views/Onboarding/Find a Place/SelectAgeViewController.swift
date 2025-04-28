//
//  SelectAgeViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class SelectAgeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [SelectAge] = [SelectAge]()
    var selectedState: [Bool] = []
    var selectedStatus: SelectAge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.a_18_24, .a_25_34, .a_35_44, .a_45_plus]
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

extension SelectAgeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SelectionTableViewCell.self), for: indexPath) as? SelectionTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.lblSelection.text = list[indexPath.row].rawValue
        cell.selectionIcon.isHidden = true
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
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SelectAgeViewController.self)) as? SelectAgeViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
