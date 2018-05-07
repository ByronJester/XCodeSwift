import UIKit



class MyCell: UITableViewCell {
    

    var feed: NewsfeedData?{
        didSet{
            self.updateUI()
        }
    }

    func updateUI(){
        nameLabelC.text = feed?.name
        postLabel.text = feed?.postStatus
        buttonL.setTitle(feed?.likeCount, for: .normal)
        buttonL.setTitle("LIKE", for: .normal)
        buttonC.setTitle(feed?.commentCount, for: .normal)
        buttonC.setTitle("COMMENT", for: .normal)

    }
    
    lazy var nameLabelC : UILabel = {
        let nameLabelC = UILabel()
        nameLabelC.text = "Byron Jester"
        nameLabelC.font = UIFont.systemFont(ofSize: 15)
        nameLabelC.textAlignment = .left
//        nameLabelC.layer.borderWidth = 1
        nameLabelC.translatesAutoresizingMaskIntoConstraints = false
        return nameLabelC
    }()
    
    lazy var labelD : UILabel = {
        let labelD = UILabel()
        labelD.text = "April 23, 2018"
        labelD.font = UIFont.systemFont(ofSize: 10)
        labelD.textAlignment = .left
        //        nameLabelC.layer.borderWidth = 1
        labelD.translatesAutoresizingMaskIntoConstraints = false
        return labelD
    }()
    
    lazy var labelT : UILabel = {
        let labelT = UILabel()
        labelT.text = "10:25 AM"
        labelT.font = UIFont.systemFont(ofSize: 10)
        labelT.textAlignment = .left
        //        nameLabelC.layer.borderWidth = 1
        labelT.translatesAutoresizingMaskIntoConstraints = false
        return labelT
    }()
    
    lazy var pImage : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.backgroundColor = UIColor.white
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "wewsss")
        img.contentMode = .scaleAspectFit
        img.layer.borderWidth = 1
        return img
    }()

    lazy var postLabel : UILabel = {
        let postLabel = UILabel()
        postLabel.text = ""
        postLabel.font = UIFont.systemFont(ofSize: 20)
        postLabel.textAlignment = .center
        postLabel.layer.borderWidth = 1
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    lazy var buttonL : UIButton = {
        let buttonL = UIButton(type: .system)
        buttonL.setTitle("Like", for: .normal)
        buttonL.layer.borderWidth = 1
        buttonL.backgroundColor = UIColor.white
        buttonL.setTitleColor(.black, for: .normal)
//        buttonL.addTarget(self, action: #selector(liked), for: .touchUpInside)
        buttonL.translatesAutoresizingMaskIntoConstraints = false
        return buttonL
    }()
    
    lazy var buttonC : UIButton = {
        let buttonC = UIButton(type: .system)
        buttonC.setTitle("Comment", for: .normal)
        buttonC.backgroundColor = UIColor.white
        buttonC.layer.borderWidth = 1
        buttonC.setTitleColor(.black, for: .normal)
        buttonC.translatesAutoresizingMaskIntoConstraints = false
        return buttonC
    }()
    
    lazy var separatorLineView: UIView = {
        let uiview = UIView()
        uiview.backgroundColor = .black
        uiview.translatesAutoresizingMaskIntoConstraints = false
        return uiview
    }()
    
    
    func setupViews(){
        self.backgroundColor = UIColor.white
//        self.assignbackground()
        //ios 9 constraints
        
//        let marginGuide = contentView.layoutMarginsGuide
        
        self.addSubview(nameLabelC)
        nameLabelC.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        nameLabelC.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        nameLabelC.widthAnchor.constraint(equalToConstant: self.frame.width - 60).isActive = true
        nameLabelC.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.addSubview(labelD)
        labelD.topAnchor.constraint(equalTo: nameLabelC.bottomAnchor, constant: 3).isActive = true
        labelD.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        labelD.widthAnchor.constraint(equalToConstant: self.frame.width - 50).isActive = true
        labelD.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(labelT)
        labelT.topAnchor.constraint(equalTo: labelD.bottomAnchor, constant: 2).isActive = true
        labelT.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        labelT.widthAnchor.constraint(equalToConstant: self.frame.width - 50).isActive = true
        labelT.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(pImage)
        pImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        pImage.leadingAnchor.constraint(equalTo: nameLabelC.trailingAnchor, constant: 5).isActive = true
        pImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        pImage.widthAnchor.constraint(equalToConstant: self.frame.width - 40).isActive = true
        pImage.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
        
        self.addSubview(postLabel)
        postLabel.topAnchor.constraint(equalTo: pImage.bottomAnchor, constant: 10).isActive = true
        postLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        postLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        postLabel.widthAnchor.constraint(equalToConstant: self.frame.width - 20).isActive = true
        postLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(buttonL)
        buttonL.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 5).isActive = true
        buttonL.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        buttonL.widthAnchor.constraint(equalToConstant: self.frame.width - 140).isActive = true
        buttonL.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(buttonC)
        buttonC.topAnchor.constraint(equalTo: postLabel.bottomAnchor, constant: 5).isActive = true
        buttonC.leadingAnchor.constraint(equalTo: buttonL.trailingAnchor, constant: 5).isActive = true
        buttonC.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5).isActive = true
        buttonC.widthAnchor.constraint(equalToConstant: self.frame.width - 140).isActive = true
        buttonC.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        self.addSubview(separatorLineView)
        separatorLineView.topAnchor.constraint(equalTo: buttonC.bottomAnchor, constant: 5).isActive = true
        separatorLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        separatorLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        separatorLineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    func del(){
    
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupViews()
//        self.assignbackground()
        
        let height: CGFloat = 150
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
    }
}

