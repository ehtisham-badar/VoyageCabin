//
//  SelectionCollectionViewCell.swift
//  VoyageCabin
//
//  Created by APPLE on 07/05/2025.
//

import UIKit

class SelectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.cornerRadius = 35
        lblTitle.font = UIFont.lexend400Regular(size: 12)
    }
}
