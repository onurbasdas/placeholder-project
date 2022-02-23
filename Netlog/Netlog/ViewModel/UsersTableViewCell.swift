//
//  UsersTableViewCell.swift
//  Netlog
//
//  Created by Onur Başdaş on 23.02.2022.
//

import UIKit

class UsersTableViewCell: UITableViewCell {
    
    static let identifier = "UsersTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "UsersTableViewCell", bundle: nil)
    }

    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDesc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadData(userObject : UsersModel?) {
        lblName.text = userObject?.name
        lblDesc.text = userObject?.username
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
