//
//  ProfileViewController.swift
//  Instagram-Parse
//
//  Created by Maliha Fairooz on 3/19/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    var window: UIWindow?
    let mystoryboard = UIStoryboard(name: "Main", bundle: nil)
    var userDidLogoutNotification = "userDidLogoutNotification"
    
    @IBOutlet weak var logoutButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onLogout(sender: AnyObject) {
        PFUser.logOut()
        
        print ("logged out")
        
        self.performSegueWithIdentifier("loginPage", sender: nil)
        
        
        
        //let vc = mystoryboard.instantiateInitialViewController()! as UIViewController
        //window?.rootViewController = vc
        
       // NSNotificationCenter.defaultCenter().postNotification(userDidLogoutNotification, object:nil)
        
        
            
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
    






