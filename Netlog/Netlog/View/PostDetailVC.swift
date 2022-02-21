//
//  PostDetailVC.swift
//  Netlog
//
//  Created by Onur Başdaş on 21.02.2022.
//

import UIKit

class PostDetailVC: UIViewController {

    @IBOutlet var backView: UIView!
    @IBOutlet var lblDetailTitle: UILabel!
    @IBOutlet var lblDetailDesc: UILabel!
    @IBOutlet var detailTableView: UITableView!
    
    var postDetail : PostsModel?
    var service = Service()
    var postDetailArray = [PostCommentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        getData()
    }
    
    func configureUI() {
        detailTableView.register(PostDetailTableViewCell.nib(), forCellReuseIdentifier: PostDetailTableViewCell.identifier)
        backView.layer.cornerRadius = 8
        lblDetailTitle.text = postDetail?.title
        lblDetailDesc.text = postDetail?.body
    }
    
    func getData() {
        service.getPostCommentData(id: postDetail?.userId ?? 1) { response, message in
            if let message = message {
                print(message)
            }
            guard let response = response else {
                return
            }
            DispatchQueue.main.async { [self] in
                postDetailArray.append(contentsOf: response)
                detailTableView.reloadData()
            }
        }
    }
}

extension PostDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postDetailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: PostDetailTableViewCell.identifier, for: indexPath) as! PostDetailTableViewCell
        let indexDetail = postDetailArray[indexPath.row]
        cell.loadData(data: indexDetail)
        return cell
    }
    
    
}
