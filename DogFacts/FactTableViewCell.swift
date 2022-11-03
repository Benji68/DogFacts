//
//  FactTableViewCell.swift
//  DogFacts
//
//  Created by benjamin.chrysostom on 03/11/22.
//

import UIKit

class FactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var factSaveImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        factSaveImage.image = UIImage(systemName: "bookmark")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
