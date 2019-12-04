//
//  TodoCell.swift
//  RxSwiftTest
//
//  Created by HenryCheng on 2019/12/3.
//  Copyright © 2019 igancao. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
