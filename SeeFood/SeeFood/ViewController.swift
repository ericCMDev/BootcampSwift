//
//  ViewController.swift
//  SeeFood
//
//  Created by Eric Cabestany Mena on 2/3/23.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[.originalImage] as? UIImage {
            imageView.image = userPickedImage
            
            guard let ciimage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CII image")
            }
            
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true)
    }
    
    func detect(image: CIImage) {
        
        //Deprecated Init
//        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
//            fatalError("Loading CoreML Model failed.")
//        }
        
        //new way to do init
        guard let mlModel = try? Inceptionv3(configuration: .init()).model, let model = try? VNCoreMLModel(for: mlModel) else {
            fatalError("Loading CoreML Model failed.")
        }
        
        let request = VNCoreMLRequest(model: model) { request, error in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Model failed to process image.")
            }
            if let firstResult = results.first {
                if firstResult.identifier.contains("hotdog") {
                    self.navigationItem.title = "Hotdog"
                } else {
                    self.navigationItem.title = "Not Hotdog"
                }
            }
        }
            
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true)
        
    }
    
    
    
}

