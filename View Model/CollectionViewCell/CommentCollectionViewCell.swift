//
//  CommentCollectionViewCell.swift
//  TechnicalTestInsura
//
//  Created by Michael Tanakoman on 18/12/21.
//

import UIKit

class CommentCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var txtName: UILabel!
    @IBOutlet weak var txtComment: UILabel!
    
    static func nib() -> UINib{
        return UINib(nibName: "CommentCollectionViewCell", bundle: nil)
    }
    
    static let identifier = "cellComment"
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
}
