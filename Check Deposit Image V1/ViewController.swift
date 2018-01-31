//
//  ViewController.swift
//  Check Deposit Image V1
//
//  Created by EDI on 4/1/18.
//  Copyright © 2018 EDI. All rights reserved.
//

import UIKit

class CheckImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: Properties
    @IBOutlet weak var photoImageView: UIImageView!
    
    //MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: IBActions and other functions
    
    @IBAction func CancelBarButtonWasPressed(_ sender: UIBarButtonItem) {
        cancelAlertAction()
    }
    
    @IBAction func addPhotoImage(_ sender: UIButton) {
        bottomActionSheetPressed()
    }
    
    
    //MARK: PhotoLibrary Functions
    func selectFromGallery() {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    //MARK: Camera Functions
    func getAnImage() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraImagePickerController = UIImagePickerController()
            cameraImagePickerController.sourceType = .camera
            cameraImagePickerController.delegate = self
            present(cameraImagePickerController, animated: true, completion: nil)
        }
    }
    
    // Segue for the Cancel Button
    func transactionWasCancelled() {
        performSegue(withIdentifier: "transactionCancelled", sender: Any?.self)
    }
    
    //MARK: Bottom ActionSheet
    
    func bottomActionSheetPressed() {
        let alert = UIAlertController(title: nil, message: "Get an image of your check", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Select from Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.selectFromGallery()}))
        alert.addAction(UIAlertAction(title: "Capture an image", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.getAnImage()}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // Alert for the Cancel Button
    func cancelAlertAction() {
        let alert = UIAlertController(title: "Cancel Transaction?", message: "This transaction will not be saved", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.transactionWasCancelled()}))
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: PhotoLibrary Functions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {fatalError("Expected a dictionary containing an image, but was provided the following: \(info)") }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    

}
