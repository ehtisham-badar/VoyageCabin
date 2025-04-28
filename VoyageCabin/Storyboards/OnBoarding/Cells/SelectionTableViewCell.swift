//
//  SelectionTableViewCell.swift
//  VoyageCabin
//
//  Created by APPLE on 27/04/2025.
//

import UIKit

class SelectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var selectionIcon: UIImageView!
    @IBOutlet weak var lblSelection: UILabel!
    @IBOutlet weak var selectUnselecticon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
