//
//  PostCollectionViewCell.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 17/12/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var txtContent: UILabel!
    @IBOutlet weak var labelSumComment: UILabel!
    @IBOutlet weak var viewBackground: UIView!
    
    static func nib() -> UINib{
        return UINib(nibName: "PostCollectionViewCell", bundle: nil)
    }
    
    static let identifier = "cellPost"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBackground.layer.cornerRadius = 10
        viewBackground.layer.borderWidth = 1
        viewBackground.layer.borderColor = #colorLiteral(red: 0.9866532683, green: 0.5863298774, blue: 0.4647909403, alpha: 1)
    }
}
