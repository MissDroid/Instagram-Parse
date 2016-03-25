//
//  InstaCell.swift
//  Instagram-Parse
//
//  Created by Maliha Fairooz on 3/19/16.
//  Copyright © 2016 Maliha Fairooz. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class InstaCell: UITableViewCell {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var photoView: PFImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    var post: PFObject!
        {
    didSet
    {
        photoView.file = post["media"] as? PFFile
        captionLabel.text = post["caption"] as? String
       // usernameLabel.text = post["author"] as? String
        usernameLabel.text = PFUser.currentUser()?.username
        
    
    }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
