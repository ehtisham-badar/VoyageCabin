//
//  PropertyPreferenceTableViewCell.swift
//  VoyageCabin
//
//  Created by APPLE on 11/05/2025.
//

import UIKit

class PropertyPreferenceTableViewCell: UITableViewCell {

    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lblTitle.font = UIFont.lexend300Light(size: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
