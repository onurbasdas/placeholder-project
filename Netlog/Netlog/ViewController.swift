//
//  ViewController.swift
//  Netlog
//
//  Created by Onur Başdaş on 18.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var service = Service()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        service.exchangeList { response, error in
            if let error = error {
                print(error)
                return
            }
            guard let response = response else {
                return
            }
            print(response)
        }
        
    }


}

