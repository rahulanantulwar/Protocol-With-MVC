//
//  PostViewCell.swift
//  PostMVCDemo
//
//  Created by User on 31/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class PostViewCell: UITableViewCell {

    static let identifier: String = "postcell"
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UITextView!
    
    //set data to lables
    func populate(with user: Post)  {
        
        titleLbl.text = user.title
        descLbl.text = user.desc
    }
    
    
}
