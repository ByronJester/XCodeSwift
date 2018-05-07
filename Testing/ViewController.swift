//
//  ViewController.swift
//  Testing
//
//  Created by Byron on 3/22/18.
//  Copyright © 2018 Byron. All rights reserved.
//


import UIKit
import Foundation
import RxSwift
import Alamofire
import DKImagePickerController

class ViewController: UIViewController{

    let disposeBag = DisposeBag()
    
    lazy var pimage : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "wewsss")
        img.contentMode = .scaleAspectFit
        img.layer.borderColor = UIColor.white.cgColor
//        img.layer.borderWidth = 1
        img.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleProfileImage)))
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var username : UITextField = {
        let username = UITextField ()
        username.textAlignment = .center
        username.textColor = UIColor.yellow
        username.layer.borderColor = UIColor.white.cgColor
        username.layer.borderWidth = 1
        username.layer.cornerRadius = 3
        username.translatesAutoresizingMaskIntoConstraints = false
        username.attributedPlaceholder = NSAttributedString(string: "Enter Username", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        return username
    }()
    
    lazy var password : UITextField = {
        let password = UITextField ()
        password.textAlignment = .center
        password.textColor = UIColor.yellow
        password.layer.borderColor = UIColor.white.cgColor
        password.layer.borderWidth = 1
        password.translatesAutoresizingMaskIntoConstraints = false
        password.attributedPlaceholder = NSAttributedString(string: "Enter Password", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        password.layer.cornerRadius = 3
        password.isSecureTextEntry = true
        return password
    }()
    
    lazy var email : UITextField = {
        let email = UITextField ()
        email.textAlignment = .center
        email.textColor = UIColor.yellow
        email.layer.borderColor = UIColor.white.cgColor
        email.layer.borderWidth = 1
        email.attributedPlaceholder = NSAttributedString(string: "Enter Email", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        email.layer.cornerRadius = 3
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    lazy var name : UITextField = {
        let name = UITextField ()
        name.textAlignment = .center
        name.textColor = UIColor.yellow
        name.layer.borderColor = UIColor.white.cgColor
        name.layer.borderWidth = 1
        name.attributedPlaceholder = NSAttributedString(string: "Enter Name", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        name.layer.cornerRadius = 3
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var phone : UITextField = {
        let phone = UITextField ()
        phone.textAlignment = .center
        phone.textColor = UIColor.yellow
        phone.layer.borderColor = UIColor.white.cgColor
        phone.layer.borderWidth = 1
        phone.layer.cornerRadius = 3
        phone.attributedPlaceholder = NSAttributedString(string: "Enter Phone Number", attributes: [NSForegroundColorAttributeName: UIColor.yellow])
        phone.translatesAutoresizingMaskIntoConstraints = false
        return phone
    }()
    
    lazy var button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(handlerRegister), for: .touchUpInside)
        return button
    }()
    
    
    lazy var button1 : UIButton = {
        let button1 = UIButton(type: .system)
        button1.setTitle("Login Your Account", for: .normal)
        button1.backgroundColor = .blue
        button1.setTitleColor(.white, for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.addTarget(self, action: #selector(nextViewLogin), for: .touchUpInside)
        button1.layer.cornerRadius = 5
        return button1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.assignbackground()
    
    }
    
    
    func setupViews(){
        view.backgroundColor = UIColor.white
        //ios 9 constraints
        
        
        view.addSubview(pimage)
        pimage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        pimage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        pimage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        pimage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        

        view.addSubview(username)
        username.topAnchor.constraint(equalTo: pimage.bottomAnchor, constant: 10).isActive = true
        username.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        username.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        username.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(password)
        password.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 10).isActive = true
        password.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        password.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        password.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(email)
        email.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 10).isActive = true
        email.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        email.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        email.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(name)
        name.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 10).isActive = true
        name.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        name.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(phone)
        phone.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10).isActive = true
        phone.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        phone.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        phone.heightAnchor.constraint(equalToConstant: 30).isActive = true
        

        view.addSubview(button)
        button.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 15).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(button1)
        button1.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        button1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 35).isActive = true

    }
    //Background Image
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
    
    //Pick Profile Picture
    func handleProfileImage(){
        
        let picker = DKImagePickerController()
        
        picker.maxSelectableCount = 1
        picker.singleSelect       = true
        picker.didSelectAssets = { (assets: [DKAsset]) in
            for asset in assets {
                asset.fetchOriginalImageWithCompleteBlock({ (image, info) in
                    self.pimage.image       = image
                    self.pimage.contentMode = .scaleAspectFit
                })
            }
        }
        present(picker, animated: true, completion: nil)
    }
    
    

    //Resgiter Account Action
    func handlerRegister(){
        let param: Parameters=[
            "username": username.text!,
            "password":password.text!,
            "email":email.text!,
            "name":name.text!,
            "phone":phone.text!,
        ]
        
        let vc  = LoginViewController() //change this to your class name
        
        let sucActionSheet = UIAlertController(title: "Success", message: "Registration Done", preferredStyle: .alert)
        let sucAlertAction = UIAlertAction( title : "Okay" ,
                                            style : .default) { action in self.present(vc, animated: true, completion: {
                                            })
        }
        let failActionSheet = UIAlertController(title: "Sorry", message: "Incomplete Registration", preferredStyle: .alert)
        let failAlertAction = UIAlertAction( title : "Okay" ,
                                             style : .default) { action in
        }
        
        APIService().register(param)?
            .subscribe(
                onNext: { response in
                    print("Response: \(response)\n")
                    if response.code! == "1"{
                        sucActionSheet.addAction(sucAlertAction)
                        self.present(sucActionSheet, animated: true, completion: nil)
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
    
    func nextViewLogin(){
        
        let vc = LoginViewController() //change this to your class name
        self.present(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}

