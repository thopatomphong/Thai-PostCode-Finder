//
//  PostCodeTableViewCell.swift
//  PostCode
//
//  Created by Patomphong Wongkalasin on 7/16/2560 BE.
//  Copyright © 2560 ReedUs Tech. All rights reserved.
//

import UIKit

class PostCodeTableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    @IBOutlet weak var labelAddress : UILabel!
    @IBOutlet weak var labelProvince : UILabel!
    @IBOutlet weak var labelPostCode : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
