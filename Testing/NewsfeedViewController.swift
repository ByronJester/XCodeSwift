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


class NewsFeedViewController: UIViewController{
    
    var posts: [NewsfeedData] = [NewsfeedData](){
        didSet{
            self.tableView.reloadData()
        }
    }
    
//    var feed: GetNames?{
//        didSet{
//            self.updateUI()
//        }
//    }
//
//    func updateUI(){
//        nameLabel.text = feed?.name
//    }

    var username: String?
    
    let cellID : String = "cellID"
    let disposeBag = DisposeBag()
    
    lazy var postStatus : UITextField = {
        let postStatus = UITextField()
        postStatus.font = UIFont.systemFont(ofSize: 20)
        postStatus.textAlignment = .center
        postStatus.textColor = UIColor.black
        postStatus.layer.borderColor = UIColor.lightGray.cgColor
        postStatus.layer.borderWidth = 2
        postStatus.attributedPlaceholder = NSAttributedString(string: "Whats on your mind ?", attributes: [NSForegroundColorAttributeName: UIColor.black])
        postStatus.translatesAutoresizingMaskIntoConstraints = false
        return postStatus
        }()

    lazy var button : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handlerPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()
    
    lazy var separatorLineView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .black
        uiview.translatesAutoresizingMaskIntoConstraints = false
        return uiview
        }()
    
    lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
//        tableView.backgroundView = UIImageView(image: UIImage(named: "wow")!)
        tableView.register(MyCell.self, forCellReuseIdentifier: self.cellID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    

    var nameLabel : UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = ""
        nameLabel.font = UIFont.systemFont(ofSize: 20)
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
//        self.assignbackground()
        
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
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

//        func showLoginViewController(){
//            let loginViewController = LoginViewController()
//            present(loginViewController, animated: true, completion: {})
//        }
//
//
//
//        func isLoggedIn() -> Bool {
//            return UserDefaults.standard.isLoggedIn()
//        }



    func setupViews(){
        view.backgroundColor = UIColor.white
        //ios 9 constraints
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 140).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        nameLabel.text = self.username
        
        view.addSubview(postStatus)
        postStatus.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 35).isActive = true
        postStatus.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        postStatus.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        postStatus.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        postStatus.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: postStatus.bottomAnchor, constant: 15).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        view.addSubview(separatorLineView)
        separatorLineView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10).isActive = true
        separatorLineView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        separatorLineView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
//        view.addSubview(tableView)
//        tableView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 15).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: separatorLineView.topAnchor, constant: 5).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        self.newsfeedData()
    }


    func handlerPost(){
        let param: Parameters = [
            "postStatus": postStatus.text!,]

        APIService().postStatus(param)?
            .subscribe(
                onNext: { response in
                    print("Response: \(response)\n")
                    if response.code! == "1"{
                        
                        let sucActionSheet = UIAlertController(title: "Success", message: "Done Posting", preferredStyle: .alert)
                        let sucAlertAction = UIAlertAction( title : "Okay" ,
                                                            style : .default) { action in
                        }
                        
                        sucActionSheet.addAction(sucAlertAction)
                        self.present(sucActionSheet, animated: true, completion: nil)
                            print("Successfuly Posted")
                        
                    }else{
                        
                        let failActionSheet = UIAlertController(title: "Sorry", message: "Invalid to Post Blank", preferredStyle: .alert)
                        let failAlertAction = UIAlertAction( title : "Okay" ,
                                                             style : .default) { action in
                        }
                        
                        failActionSheet.addAction(failAlertAction)
                        self.present(failActionSheet, animated: true, completion: nil)
                            print("Error Occured while Posting")
                    }
                    self.newsfeedData()
            },
                onError: { error in
                    print(error.localizedDescription)
            },
                onCompleted: {
        }).addDisposableTo(disposeBag)
    }
    
    func newsfeedData(){
        let param: Parameters=[:]
        self.posts.removeAll()
        APIService().newsfeedData(param)?
            .subscribe(
                onNext: { response in
                    for feed in response{
                        let post = NewsfeedData(name: feed.name, postStatus: feed.postStatus, likeCount: feed.likeCount, commentCount: feed.commentCount)
                            self.posts.append(post)
                    }
            },
                onError: { error in
                    print(error.localizedDescription)
            },
                onCompleted: {
        }).addDisposableTo(disposeBag)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//FOR TABLE VIEW DATASOUCE
extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! MyCell
        cell.feed = self.posts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableViewAutomaticDimension 
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        tableView.estimatedRowHeight = 100
//        tableView.rowHeight = UITableViewAutomaticDimension
//    }
}


