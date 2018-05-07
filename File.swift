////
////  File.swift
////  Testing
////
////  Created by Byron on 4/2/18.
////  Copyright © 2018 Byron. All rights reserved.
////
//
//import UIKit
//import Foundation
//
//protocol MyCellProtocol {
//    func deleteName(name: String)
//}
//
//class ViewController: UIViewController, MyCellProtocol{
//
//    let cellID : String = "cellID"
//
//    let pImage : UIImageView = {
//        let img = UIImageView()
//        img.contentMode = .scaleAspectFit
//        img.backgroundColor = UIColor.white
//        img.translatesAutoresizingMaskIntoConstraints = false
//        img.image = UIImage(named: "img-1")
//        img.contentMode = .scaleAspectFit
//        return img
//    }()
//
//    let status : UITextView = {
//        let TextView = UITextView()
//        TextView.text = "Whats on your mind ?"
//        TextView.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
//        TextView.backgroundColor = UIColor.white
//        TextView.textAlignment = .left
//        TextView.layer.borderColor = UIColor.lightGray.cgColor
//        TextView.layer.borderWidth = 1
//        TextView.translatesAutoresizingMaskIntoConstraints = false
//        return TextView
//    }()
//
//    lazy var button : UIButton = {
//        let button = UIButton(type: .system)
//        button.setTitle("Post", for: .normal)
//        button.backgroundColor = .blue
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(self.buttonAction), for: .touchUpInside)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
//
//    lazy var separatorLineView: UIView = {
//        let uiview = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 1))
//        uiview.backgroundColor = .lightGray
//        uiview.translatesAutoresizingMaskIntoConstraints = false
//        return uiview
//    }()
//
//    lazy var tableView : UITableView = {
//        let tableView = UITableView()
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.allowsSelection = true
//        tableView.register(MyCell.self, forCellReuseIdentifier: self.cellID)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.separatorStyle = .none
//        return tableView
//    }()
//
//    var posts: [Post] = [Post](){
//        didSet{
//            self.tableView.reloadData()
//        }
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setupViews()
//    }
//
//    func setupViews(){
//        view.backgroundColor = UIColor.white
//        //ios 9 constraints
//
//        view.addSubview(status)
//        status.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
//        status.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        status.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        status.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
//        status.heightAnchor.constraint(equalToConstant: 100).isActive = true
//
//        view.addSubview(button)
//        button.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 15).isActive = true
//        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
//        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
//
//        view.addSubview(separatorLineView)
//        separatorLineView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 15).isActive = true
//        separatorLineView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        separatorLineView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        separatorLineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
//
//
//        view.addSubview(tableView)
//        tableView.topAnchor.constraint(equalTo: separatorLineView.bottomAnchor, constant: 15).isActive = true
//        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//
//        self.appendSampleData()
//    }
//
//    func appendSampleData(){
//        let post1 = Post(userid: "1", name: "Byron", profileImage: "", postid: "0", caption: "Hello World", image: "", likeCount: "23", commentCount: "40")
//        posts.append(post1)
//    }
//
//    @objc func buttonAction(){
//        print("Button was clicked")
//        guard let text = status.text else {
//            return
//        }
//
//        if text == ""{
//            return
//        }
//
//        let post1 = Post(userid: "1", name: text, profileImage: "", postid: "0", caption: "Hello World", image: "", likeCount: "23", commentCount: "40")
//        posts.insert(post1, at: 0)
//        status.text = nil
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    func deleteName(name: String){
//        print("Delete button was clicked")
//    }
//
//    @IBAction func btnNew(_ sender: Any) {
//
//    }
//    
//}
//
//extension ViewController : UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return posts.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellID, for: indexPath) as! MyCell
//        cell.post = self.posts[indexPath.row]
//        cell.delegate = self
//        return cell
//    }

//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            //return 60
//        }
//
//
//}
//
