//
//  ViewController.swift
//  Instagram-Parse
//
//  Created by Maliha Fairooz on 3/14/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
  
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    @IBAction func onLogin(sender: AnyObject) {
       
        //let username = usernameField.text!
        //let password = passwordField.text!
        //let email = emailField.text!
        
        
        PFUser.logInWithUsernameInBackground(emailField.text!, password: passwordField.text!) { (user: PFUser?, error:NSError?) -> Void in
            
            if let error = error {
                print("User login failed.")
                print(error.localizedDescription)
            } else {
                print("User logged in successfully")
                // display view controller that needs to shown after successful login
                
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                
                
            }
        }
    }
    
    @IBAction func onRegister(sender: AnyObject) {
        
        
        let newUser = PFUser()
        
        // set user properties
        
        newUser.username = emailField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if success {
               print ("Yay, account made")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else {
                print(error?.localizedDescription)
                if error?.code == 202
                {
                    print ("Username is taken, try again")
                }
            }
            
         

    }
    
    
}

}


