//
//  EntriesViewCell.swift
//  passwordKeeper
//
//  Created by RD on 2/18/21.
//

import UIKit

class EntriesViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    
    static let identifier = "EntriesViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    //this takes whatevr object you want to configure with, in this case a image
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    //tell collection view to use cell we created/register cell
    static func nib() -> UINib {
        return UINib(nibName: "EntriesViewCell", bundle: nil)
    }
}
