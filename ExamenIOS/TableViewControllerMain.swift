//
//  TableViewControllerMain.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit

class TableViewControllerMain: UITableViewController {
    
    var userName: String = ""
    var userImage: UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath) as! TableViewCellUserName
            cell.delegate = self

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "profilePic", for: indexPath) as! TableViewCellUserPic
            cell.viewController = self
            cell.delegate = self

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "description", for: indexPath) as! TableViewCellDescription

            // Configure the cell...
            cell.delegate = self

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "upload", for: indexPath) as! TableViewCellUpload
            cell.delegate = self

            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

            // Configure the cell...

            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension TableViewControllerMain: UploadUserPicDelegate, InfoChangedDelegate, ChangeViewDelegate {
    func cellTapped() {
        self.performSegue(withIdentifier: "graphics", sender: self)
    }
    
    func infoChanged(info: String) {
        userName = info
    }
    
    func infoChanged(info: UIImage) {
        userImage = info
    }
    
    func UploadPhoto() {
        let upload = UploadClass()
        upload.uploadImage(image: userImage, name: userName, viewController: self)
    }
}
