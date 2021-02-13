//
//  TableViewCellDescription.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit

protocol ChangeViewDelegate {
    func cellTapped()
}

class TableViewCellDescription: UITableViewCell {
    var delegate: ChangeViewDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            delegate?.cellTapped()
        }
        
    }

}
