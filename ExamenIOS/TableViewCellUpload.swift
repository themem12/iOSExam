//
//  TableViewCellUpload.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit

protocol UploadUserPicDelegate {
    func UploadPhoto()
}

class TableViewCellUpload: UITableViewCell {

    @IBOutlet weak var uploadButton: UIButton!
    
    var delegate: UploadUserPicDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        uploadButton.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func uploadButtonTapped(_ sender: Any) {
        delegate?.UploadPhoto()
    }
}
