//
//  AboutYouViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 06/05/2025.
//

import UIKit

class AboutYouViewController: UIViewController {
    
    @IBOutlet weak var defaultView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewPicker: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    let options = ["Me", "Couple", "Group"]
    var selectedOption = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPicker()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
    }
    @IBAction func onClickNext(_ sender: Any) {
        if defaultView.isHidden == true{
            let storyboard = UIStoryboard(name: "Renter", bundle: nil)
            guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ProfessionalStatusViewController.self)) as? ProfessionalStatusViewController else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            defaultView.isHidden = true
            tableView.isHidden = false
            registerNibs()
        }
    }
    @IBAction func onClickBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setPicker() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    func registerNibs() {
        tableView.register(UINib(nibName: String(describing: AboutYouTableViewCell.self),bundle: nil),forCellReuseIdentifier: String(describing: AboutYouTableViewCell.self))
    }
    @IBAction func onClickDoneButton(_ sender: Any) {
        viewPicker.isHidden = true
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        guard let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AboutYouTableViewCell else { return }
        cell.lblSelection.isHidden = false
        cell.lblSelection.text = options[selectedRow]
        cell.showHideViews(selection: options[selectedRow])
        selectedOption = options[selectedRow]
        tableView.reloadData()
    }
    @IBAction func onClickCancelButton(_ sender: Any) {
        viewPicker.isHidden = true
    }
}

extension AboutYouViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selectedOption == "Me" {
            return 1
        } else if selectedOption == "Couple"{
            return 2
        } else if selectedOption == "Group" {
            return 2
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedOption == "Me" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutYouTableViewCell.self)) as? AboutYouTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            cell.showHideViews(selection: selectedOption)
            cell.lblHeading.text = "About You"
            return cell
        } else if selectedOption == "Couple"{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutYouTableViewCell.self)) as? AboutYouTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            cell.showHideViews(selection: selectedOption)
            if indexPath.row != 0 {
                cell.lblHeading.text = "About Your Partner"
                cell.profilePicView.isHidden = false
            }
            return cell
        } else if selectedOption == "Group" {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutYouTableViewCell.self)) as? AboutYouTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            cell.showHideViews(selection: selectedOption)
            if indexPath.row != 0 {
                cell.lblHeading.text = "About Your Friend"
                cell.profilePicView.isHidden = false
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: AboutYouTableViewCell.self)) as? AboutYouTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension AboutYouViewController: AboutYouTableViewCellDelegate {
    func selectPlaceFor() {
        viewPicker.isHidden = false
    }
    func openSheet(){
        let storyboard = UIStoryboard(name: "Renter", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: String(describing: OpenPickerPhotoViewController.self)) as? OpenPickerPhotoViewController else { return }
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true)
    }
}
extension AboutYouViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return options.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
}
