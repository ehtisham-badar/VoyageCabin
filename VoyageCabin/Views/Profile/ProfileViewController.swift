//
//  ProfileViewController.swift
//  VoyageCabin
//
//  Created by APPLE on 03/05/2025.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var fNameTF: UITextField!
    @IBOutlet weak var lNameTF: UITextField!
    @IBOutlet weak var dobTF: UITextField!
    @IBOutlet weak var btnFinish: UIButton!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var profileImageView: UIImageView!
    
    private let datePicker = UIDatePicker()
    private var profileImageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        addDoneOnTF()
        setupDatePicker()
        updateFinishBtn()
    }
    
    func updateFinishBtn() {
        btnFinish.isEnabled = false
        btnFinish.alpha = 0.5
        
        [fNameTF, lNameTF, dobTF, phoneTF].forEach { tf in
            tf?.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        }
    }
    @objc func textFieldsDidChange() {
        validateFields()
    }
    
    func validateFields() {
        let isAllFieldsFilled = !(fNameTF.text?.isEmpty ?? true) &&
        !(lNameTF.text?.isEmpty ?? true) &&
        !(dobTF.text?.isEmpty ?? true) &&
        !(phoneTF.text?.isEmpty ?? true)
        
        if isAllFieldsFilled && profileImageSelected {
            btnFinish.isEnabled = true
            btnFinish.alpha = 1.0
        } else {
            btnFinish.isEnabled = false
            btnFinish.alpha = 0.5
        }
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        let calendar = Calendar.current
        let today = Date()
        if let maxDate = calendar.date(byAdding: .year, value: -18, to: today) {
            datePicker.maximumDate = maxDate
        }
        dobTF.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        dobTF.inputAccessoryView = toolbar
    }
    
    @objc private func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dobTF.text = formatter.string(from: datePicker.date)
        dobTF.resignFirstResponder()
    }
    
    func addDoneOnTF() {
        fNameTF.addDoneButtonOnKeyboard()
        lNameTF.addDoneButtonOnKeyboard()
        phoneTF.addDoneButtonOnKeyboard()
    }
    @IBAction func finishBtnPressed(_ sender: Any) {
        
    }
    @IBAction func photopicker(_ sender: Any) {
        PhotoPicker.shared.delegate = self
        PhotoPicker.shared.pickPhoto(with: self)
    }
}

extension ProfileViewController: PhotoPickerDelegate{
    func didFinish(image: UIImage) {
        profileImageView.image = image
        profileImageSelected = true
        validateFields()
    }
}
