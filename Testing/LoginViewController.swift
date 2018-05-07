//
//  LoginViewController.swift
//  Testing
//
//  Created by Byron on 4/6/18.
//  Copyright © 2018 Byron. All rights reserved.
//

import UIKit
import Foundation
import RxSwift
import Alamofire


class LoginViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
//    var post: [GetNames] = [GetNames](){
//        didSet{
//        }
//    }
    
    lazy var username : UITextField = {
        let username = UITextField ()
        username.textAlignment = .center
        username.textColor = UIColor.yellow
        username.layer.borderColor = UIColor.white.cgColor
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 3
        username.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        username.translatesAutoresizingMaskIntoConstraints = false

        return username
    }()

    lazy var password : UITextField = {
        let password = UITextField ()
        password.textAlignment = .center
        password.textColor = UIColor.yellow
        password.layer.borderColor = UIColor.white.cgColor
        password.layer.borderWidth = 1
        password.translatesAutoresizingMaskIntoConstraints = false
        password.layer.cornerRadius = 3
        password.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        password.isSecureTextEntry = true
        return password
    }()
    
    lazy var button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlerLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var button1 : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register an Account", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextViewRegister), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    
    func setupViews(){
//        view.backgroundColor = UIColor.white
        self.assignbackground()
        //ios 9 constraints
        
        
        view.addSubview(username)
        username.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -90).isActive = true
        username.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        username.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        username.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        username.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(password)
        password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10).isActive = true
        password.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        password.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        password.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        password.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 15).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(button1)
        button1.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        button1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
    }
    
    func assignbackground(){
        let background = UIImage(named: "a")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubview(toBack: imageView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        
      
    }
    
    
    func handlerLogin(){
        let param: Parameters=[
            "username": username.text!,
            "password":password.text!,
        ]
        
        

        
        let nfvc  = NewsFeedViewController() //change this to your class name
//        let vcc = LoginViewController()
        
        let sucActionSheet = UIAlertController(title: "Welcome", message: "Logged in Successfuly", preferredStyle: .alert)
        let sucAlertAction = UIAlertAction( title : "Okay" ,
                                         style : .default) { action in self.present(nfvc, animated: true, completion: {
                                         })
        }
        
        let failActionSheet = UIAlertController(title: "Sorry", message: "Invalid Username or Password", preferredStyle: .alert)
        let failAlertAction = UIAlertAction( title : "Okay" ,
                                            style : .default) { action in}



        
        APIService().login(param)?
            .subscribe(
                onNext: { response in
                    print("Response: \(response)\n")
                    if response.code! == "1"{
                        sucActionSheet.addAction(sucAlertAction)
                        self.present(sucActionSheet, animated: true, completion: nil)
                        self.username.text = nfvc.username
                    }else{
                        failActionSheet.addAction(failAlertAction)
                        self.present(failActionSheet, animated: true, completion: nil)
                    }
            },
                onError: { error in
                    print(error.localizedDescription)
            },
                onCompleted: {
            }).addDisposableTo(disposeBag)
    }
    
//    func getNames(){
//        let param: Parameters=[:]
//
//        APIService().getNames(param)?
//            .subscribe(
//                onNext: { response in
//                    for feed in response{
//                        let post = GetNames(name: feed.name)
//                        self.post.append(post)
//                    }
//            },
//                onError: { error in
//                    print(error.localizedDescription)
//            },
//                onCompleted: {
//            }).addDisposableTo(disposeBag)
//    }
    
    
    func nextViewRegister(){

        let vc = ViewController() //change this to your class name
        self.present(vc, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension UserDefaults {
    func setIsLoggedIn(value: Bool) {
        set(false, forKey: "isLoggedIn")
        synchronize()
        
    }

    func isLoggedIn() -> Bool {
        return bool(forKey: "isLoggedIn")
    }
}




