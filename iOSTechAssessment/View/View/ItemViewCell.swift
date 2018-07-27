//
//  ItemViewCell.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {

    
    @IBOutlet weak var roundedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var itemViewModel: ItemCellViewModel? {
        didSet {
            if let item = itemViewModel?.item {
            self.titleLabel.text  = " "
            self.byLabel.text  = " "
            self.timeLabel.text = " "
            if let title = item.title {
                titleLabel.text = title
                if let byline = item.byline {
                    byLabel.text = byline
                }
                if let publishedDate = item.publishedDate {
                    timeLabel.text = publishedDate
                }
            }
        }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
