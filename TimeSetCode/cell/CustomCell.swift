//
//  CustomCell.swift
//  TimeSetCode
//
//  Created by Nick on 6/12/17.
//  Copyright © 2017 NickOwn. All rights reserved.
//

import UIKit


class CustomCell: UITableViewCell {
    
    @IBOutlet weak var lb_date: UILabel!
    @IBOutlet weak var userThumb: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var img1: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userThumb.layer.cornerRadius = userThumb.frame.size.width / 2
        userThumb.layer.masksToBounds = true
        userThumb.layer.borderWidth = 4
        userThumb.layer.borderColor = UIColor.init(colorLiteralRed: 171/255, green: 217/255, blue: 65/255, alpha: 1.0).cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
   
    
}
