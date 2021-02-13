//
//  TableViewCellUserPic.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit

class TableViewCellUserPic: UITableViewCell {

    @IBOutlet weak var userPicImage: UIImageView!
    @IBOutlet weak var takeButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    var viewController: UIViewController?
    
    var delegate: InfoChangedDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        takeButton.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func takePictureTapped(_ sender: Any) {
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        let actionSheet = UIAlertController(title: "Imagen", message: "Escoge tu imagen", preferredStyle:  .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cámara", style: .default, handler: { (action: UIAlertAction) in
                
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                self.imagePicker.sourceType = .camera
                self.viewController?.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Cámara no disponible")
                let alert = UIAlertController(title: "Lo sentimos", message: "No se puede acceder a la cámara.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.viewController?.present(alert, animated: true, completion: nil)
            }
               
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Carrete", style: .default, handler: { (action: UIAlertAction) in
                
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                self.imagePicker.sourceType = .photoLibrary
                self.viewController?.present(self.imagePicker, animated: true, completion: nil)
            } else {
                print("Librería no disponible")
                let alert = UIAlertController(title: "Lo sentimos", message: "No se puede acceder a la cámara.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                self.viewController?.present(alert, animated: true, completion: nil)
            }
               
        }))
               
        actionSheet.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        
        self.viewController?.present(actionSheet, animated: true, completion: nil)
    }
}

extension TableViewCellUserPic: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.userPicImage.image = image
            delegate?.infoChanged(info: image)
            self.viewController?.presentedViewController?.dismiss(animated: true, completion: nil)
        }
    }
}
