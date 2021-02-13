//
//  UploadClass.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import UIKit
import Firebase

class UploadClass {
    
    let storage = Storage.storage()
    
    func uploadImage(image: UIImage, name: String, viewController: UIViewController) {
        guard let uploadingImage = image.jpegData(compressionQuality: 0.5) else { return }
        
        let reference = storage.reference(withPath: "usersPics/\(name).jpg")
        let uploadMetaData = StorageMetadata.init()
        uploadMetaData.contentType = "image/jpeg"
        
        let taskReference = reference.putData(uploadingImage, metadata: uploadMetaData) { (downloadMetaData, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("Upload is complete and got back: \(downloadMetaData)")
        }
        
        taskReference.observe(.success) { (snapshot) in
            let alert = UIAlertController(title: "Éxito", message: "Se ha subido la imagen del usuario.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            viewController.present(alert, animated: true, completion: nil)
        }
    }
}
