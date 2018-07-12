//
//  ReviewCell.swift
//  eliDemoCustomCell
//
//  Created by Jaewon Lee on 7/11/18.
//  Copyright © 2018 Jaewon Lee. All rights reserved.
//

import UIKit


protocol ReviewCellDelegate{
    
    func starPressed(sender: ReviewCell)
    
    
}
class ReviewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var starButton: UIButton!
    
    var delegate: ReviewCellDelegate!
    
    @IBAction func starPressed(_ sender: UIButton) {
        delegate.starPressed(sender: self)
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
