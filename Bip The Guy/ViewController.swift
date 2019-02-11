//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Jason Tee on 2/2/19.
//  Copyright © 2019 Jason Tee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgaeToPunch: UIImageView!
    var audioPlayer = AVAudioPlayer()
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Mark: Functions
    func animateImage() {
        let bounds = self.imgaeToPunch.bounds
        let shrinkValue: CGFloat = 60
        //shrink image to punchg by shrinkValue pixels
        self.imgaeToPunch.bounds = CGRect(x: self.imgaeToPunch.bounds.origin.x
            + shrinkValue, y: self.imgaeToPunch.bounds.origin.y + shrinkValue, width: self.imgaeToPunch.bounds.size.width - shrinkValue, height: self.imgaeToPunch.bounds.size.height - shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imgaeToPunch.bounds = bounds}, completion: nil)
    }
    
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        //can we load in the file?
        if let sound = NSDataAsset(name: soundName){
            //check if sound.data is a sound file
            do{
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                //if sound.data is not a valid audio file
                print("ERROR: data in\(soundName) couldn't be played")
            }
        } else {
            print("ERROR: file\(soundName) didn't load" )
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imgaeToPunch.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    
    //Mark: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
        
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
        
            present(imagePicker, animated: true, completion: nil)
        } else {
            showAlert(title: "Camera Not Available", message: "There is no camera avilable on this device.")
            
        }
        
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
}

