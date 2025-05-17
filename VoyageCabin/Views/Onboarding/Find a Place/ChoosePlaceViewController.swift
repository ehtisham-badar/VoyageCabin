//
//  ChoosePlaceViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class ChoosePlaceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [ChoosePlace] = [ChoosePlace]()
    var imageArray = ["exporticon","location","lifestyle","furnished","closetotrans"]
    var selectedArray = [String]()
    var selectedState: [Bool] = []
    var selectedStatus: ChoosePlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.budget, .location, .lifestyle, .furnished, .closeto]
        selectedArray = Array(repeating: "", count: list.count) // ← remove if unnecessary
        selectedState = Array(repeating: false, count: list.count)
    }
    
    @IBAction func onClickContinue(_ sender: Any) {
        if Constants.selectedStatus == .lookingForAPlace {
            let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SelectAgeViewController.self)) as? SelectAgeViewController else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: HadTroubleViewController.self)) as? HadTroubleViewController else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    func registerNibs(){
        self.tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
        self.tableView.reloadData()
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ChoosePlaceViewController: UITableViewDelegate, UITableViewDataSource {
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
            cell.selectUnselecticon.image = UIImage.tickr
        } else {
            cell.selectUnselecticon.image = UIImage.untickr
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedState[indexPath.row].toggle()
        let selectedItem = list[indexPath.row].rawValue
        if selectedState[indexPath.row] {
            if !selectedArray.contains(selectedItem) {
                selectedArray.append(selectedItem)
            }
        } else {
            if let index = selectedArray.firstIndex(of: selectedItem) {
                selectedArray.remove(at: index)
            }
        }

        tableView.reloadRows(at: [indexPath], with: .automatic)

        print("Selected Items: \(selectedArray)")
        Constants.lookingForAPlaceBody.what_matters = selectedArray
        Constants.lookingForHousemate.what_matters = selectedArray
    }
}
