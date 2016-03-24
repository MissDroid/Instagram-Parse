//
//  CaptureViewController.swift
//  Instagram-Parse
//
//  Created by Maliha Fairooz on 3/19/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import Parse

class CaptureViewController: UIViewController, UIImagePickerControllerDelegate, UITextViewDelegate, UINavigationControllerDelegate {

    

    @IBOutlet weak var captionText: UITextView!
    @IBOutlet weak var uploadButton: UIButton!
    @IBOutlet weak var captureView: UIImageView!
   
    
    let vc = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        captionText.text = "Write a caption"
        captionText.textColor = UIColor.grayColor()
        
        self.presentViewController(vc, animated: true, completion: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
            // Get the image captured by the UIImagePickerController
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // Do something with the images (based on your use case)
            captureView.contentMode = .ScaleAspectFit
            captureView.image = originalImage
            
            // Dismiss UIImagePickerController to go back to your original view controller
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func onLibrary(sender: AnyObject) {
        
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    @IBAction func onCamera(sender: AnyObject) {
      /*
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.Camera
        
        self.presentViewController(vc, animated: true, completion: nil)
*/
    }
    @IBAction func onUpload(sender: AnyObject) {
        let newImage = Post.resize(captureView.image!, newSize: CGSize(width: 300, height: 500))
        Post.postUserImage(newImage, withCaption: captionText.text) { (success: Bool, error: NSError?) -> Void in
           
            if success {
                print("It is live!!!")
                self.captureView.image = nil
                self.captionText.text = nil
                self.tabBarController?.selectedIndex = 1
            } else {
                print("error: \(error?.localizedDescription)")
            }
            
        }
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
