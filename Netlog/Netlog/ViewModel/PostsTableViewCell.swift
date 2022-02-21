//
//  PostsTableViewCell.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    
    static let identifier = "PostsTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "PostsTableViewCell", bundle: nil)
    }
    
    @IBOutlet var backView: UIView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var lblCommentDesc: UILabel!
    @IBOutlet var lblCommentCount: UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.layer.cornerRadius = 8
    }
    
    func loadData(data: PostsModel) {
        lblTitle.text = data.title
        lblDesc.text = data.body
//        lblCommentDesc.text = commentData.body
//        lblCommentCount.text = String(commentData.postId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
