//
//  TableViewCellUserName.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit
protocol InfoChangedDelegate {
    func infoChanged(info: String)
    func infoChanged(info: UIImage)
}

class TableViewCellUserName: UITableViewCell {

    @IBOutlet weak var nameInput: UITextField!
    var delegate: InfoChangedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func textInputEdited(_ sender: UITextField) {
        var text = sender.text ?? ""
        let lastC = text.popLast()
        if let flag = lastC?.isNumber {
            if !flag {
                text.append(lastC!)
            }
        }
        sender.text = text
        delegate?.infoChanged(info: text)
    }
    
}
