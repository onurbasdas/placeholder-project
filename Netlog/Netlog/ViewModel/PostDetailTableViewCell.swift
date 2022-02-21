//
//  PostDetailTableViewCell.swift
//  Netlog
//
//  Created by Onur Başdaş on 21.02.2022.
//

import UIKit

class PostDetailTableViewCell: UITableViewCell {
    
    static let identifier = "PostDetailTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PostDetailTableViewCell", bundle: nil)
    }
    
    @IBOutlet var backView: UIView!
    @IBOutlet var detailTitle: UILabel!
    @IBOutlet var detailDesc: UILabel!
    @IBOutlet var detailEmail: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(data: PostCommentModel) {
        detailTitle.text = data.name
        detailDesc.text = data.body
        detailEmail.text = data.email
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
