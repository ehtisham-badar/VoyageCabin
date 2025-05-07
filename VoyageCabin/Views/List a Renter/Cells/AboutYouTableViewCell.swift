//
//  AboutYouTableViewCell.swift
//  VoyageCabin
//
//  Created by APPLE on 06/05/2025.
//

import UIKit

protocol AboutYouTableViewCellDelegate{
    func selectPlaceFor()
    func openSheet()
}

class AboutYouTableViewCell: UITableViewCell {

    @IBOutlet weak var selectionView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var lblSelection: UILabel!
    @IBOutlet weak var lblHeading: UILabel!
    
    @IBOutlet weak var profilePicView: UIView!
    var delegate: AboutYouTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblSelection.font = UIFont.plusJakartaSansSemiBold(size: 14)
        lblSelection.textColor = UIColor.labeBlueColor
        lblHeading.font = UIFont.plusJakartaSansSemiBold(size: 18)
        lblHeading.textColor = UIColor.black
        nameView.isHidden = true
        ageView.isHidden = true
        genderView.isHidden = true
        profilePicView.isHidden = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showHideViews(selection: String? = ""){
        nameView.isHidden = selection == ""
        ageView.isHidden = selection == ""
        genderView.isHidden = selection == ""
        profilePicView.isHidden = selection == ""
    }
    
    @IBAction func onClickSelection(_ sender: Any) {
        self.delegate?.selectPlaceFor()
    }
    @IBAction func openPickerPhoto(_ sender: Any) {
        self.delegate?.openSheet()
    }
}
