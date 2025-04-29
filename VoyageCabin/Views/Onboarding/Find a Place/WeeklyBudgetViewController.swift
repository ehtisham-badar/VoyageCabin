//
//  WeeklyBudgetViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class WeeklyBudgetViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [WeeklyBudget] = [WeeklyBudget]()
    var selectedState: [Bool] = []
    var selectedStatus: WeeklyBudget?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.under200, .w_200_350, .w_350_500, .w_500_plus]
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

extension WeeklyBudgetViewController: UITableViewDelegate, UITableViewDataSource {
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
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: OnboardingAdViewController.self)) as? OnboardingAdViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
