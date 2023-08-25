//
//  CustomTableViewCell.swift
//  CombineWithUIKit
//
//  Created by Parvendra Kumar on 25/08/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl:UILabel!
    @IBOutlet weak var descLbl:UILabel!
    @IBOutlet weak var productImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setDataOnCell(_cellData: PostModel){
        self.titleLbl.text = _cellData.title
        self.descLbl.text = _cellData.body
    }
}
