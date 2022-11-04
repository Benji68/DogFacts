//
//  FactTableViewCell.swift
//  DogFacts
//
//  Created by benjamin.chrysostom on 03/11/22.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    var isSaved: Bool = false
    
    var cellModel: Fact! {
        didSet {
            setUpCell()
        }
    }
    
    func unwrapBool(value: Bool?) -> Bool {
        guard let value_ = value else { return false }
        return value_
    }
    
    @IBAction func bookmarkButtonClicked(sender: UIButton!) {
        cellModel.isSaved = !(cellModel?.isSaved ?? false)
        isSaved = unwrapBool(value: cellModel.isSaved)
        if isSaved {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell() {
        isSaved = unwrapBool(value: cellModel.isSaved)
        factLabel.text = cellModel.fact
        if !isSaved {
            bookmarkButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        } else {
            bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
