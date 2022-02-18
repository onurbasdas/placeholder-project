//
//  ViewController.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import UIKit

class PostsViewController: UIViewController {
    
    var postsView = PostsViewModel()
    var service = Service()
    var postsArray = [PostsModel]()
    var postsCommentArray = [PostCommentModel]()
    var idArray : [Int] = []
    
    @IBOutlet var postsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postsTableView.register(PostsTableViewCell.nib(), forCellReuseIdentifier: PostsTableViewCell.identifier)
        getData()
    }
    
    func getData() {
        service.getPostsData { response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response else {
                return
            }
            
            DispatchQueue.main.async { [self] in
                postsArray.append(contentsOf: response)
                postsTableView.reloadData()
            }
            
            self.service.getPostCommentData(id: 1) { response, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let response = response else {
                    return
                }
                self.postsCommentArray.append(contentsOf: response)
                
            }
        }
    }
}

extension PostsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.identifier, for: indexPath) as! PostsTableViewCell
        let postIndex = postsArray[indexPath.row]
//        let commentIndex = postsCommentArray[indexPath.row]
        cell.loadData(data: postIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "postsDetailSegue", sender: nil)
    }
    
    
}

