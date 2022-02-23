//
//  UsersVC.swift
//  Netlog
//
//  Created by Onur Başdaş on 22.02.2022.
//

import UIKit

class UsersVC: UIViewController {
    
    
    @IBOutlet var usersSearch: UISearchBar!
    @IBOutlet var usersTableView: UITableView!
    
    var service = Service()
    var usersArray = [UsersModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usersTableView.register(UsersTableViewCell.nib(), forCellReuseIdentifier: UsersTableViewCell.identifier)
        usersTableView.separatorStyle = .none
        getUserData()
    }
    
    func getUserData() {
        service.getUsersData { response, message in
            if let message = message {
                print(message)
                return
            }
            guard let response = response else {
                return
            }
            DispatchQueue.main.async { [self] in
                usersArray.append(contentsOf: response)
                usersTableView.reloadData()
            }
        }
    }
}

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifier, for: indexPath) as! UsersTableViewCell
        let userIndex = usersArray[indexPath.row]
        cell.loadData(userObject: userIndex)
        cell.selectionStyle = .none
        return cell
    }
    
    
}
