//
//  ChallengeViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 28/04/2025.
//

import UIKit

class ChallengeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var list: [FindChallenge] = [FindChallenge]()
    var imageArray = ["notresponse","myprofile","uncertain","overwhelm"]
    var selectedState: [Bool] = []
    var selectedArray = [String]()
    var selectedStatus: FindChallenge?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setView()
    }
    
    func setView(){
        list = [.notgetting, .myprofile, .uncertain, .overwhelm]
        selectedArray = Array(repeating: "", count: list.count) // ← remove if unnecessary
        selectedState = Array(repeating: false, count: list.count)
    }
    
    func registerNibs(){
        self.tableView.register(UINib(nibName: String(describing: SelectionTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: SelectionTableViewCell.self))
        self.tableView.reloadData()
    }
    @IBAction func onClickBackButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickContinue(_ sender: Any) {
        navigateToPersonalizeScreen()
    }
    
    func navigateToPersonalizeScreen(){
        let storyboard = UIStoryboard(name: "Onboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: PersonalizeViewController.self)) as? PersonalizeViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ChallengeViewController: UITableViewDelegate, UITableViewDataSource {
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
        Constants.lookingForAPlaceBody.biggest_challenge = selectedArray
        Constants.lookingForHousemate.biggest_challenge = selectedArray
    }
}
