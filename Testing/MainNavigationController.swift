//
//  MainNavigationController.swift
//  Testing
//
//  Created by Byron on 4/20/18.
//  Copyright © 2018 Byron. All rights reserved.
//

import Foundation
import UIKit

class MainNavigationController: UINavigationController{
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        if isLoggedIn() == true{
            let homeController = NewsFeedViewController()
            viewControllers            = [homeController]
        }else {
            perform(#selector(showLoginViewController), with: nil, afterDelay: 0.01)
        }
    }
    
    fileprivate func isLoggedIn() -> Bool{
        return UserDefaults.standard.isLoggedIn()
    }
    
    func showLoginViewController(){
        let loginViewController = LoginViewController()
        present(loginViewController, animated: true, completion: {})
    }
}


