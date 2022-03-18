//
//  ViewController.swift
//  Snapsie
//
//  Created by Michael Abrams on 9/28/21.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var capturedPhotoImageView: UIImageView!
    
    @IBOutlet weak var takePhotoButtonBox: UIButton!
    
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        takePhotoButtonBox.layer.cornerRadius = takePhotoButtonBox.frame.height / 2
        
    }
    
    @IBAction func takePhotoButton(_ sender: UIButton) {
        imagePicker.allowsEditing = true
        
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
}

extension ViewController : UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            capturedPhotoImageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
}
