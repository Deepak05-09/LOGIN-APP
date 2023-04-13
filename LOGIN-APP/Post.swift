//
//  Post.swift
//  CollectionView
//
//  Created by deepak-pt6306 on 28/02/23.
//

import UIKit

class Post: UITableViewCell {

    static let identifier = "Post"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpTopView()
        setUpBottomView()
        setUpMiddleView()
        setupTopViewConstrains()
        setUpBottomConstrains()
        setRandomImage()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    let topView = UIView()
    let accountImage = UIImageView()
    let accountName = UILabel()
    let followButton = UIButton()
    let menu = UIMenu()
    
    let midView = UIView()
    let midImage = UIImageView()
    
    let bottomView = UIView()
    
    let like = UIButton()
    let share = UIButton()
    let comment = UIButton()
    let save = UIButton()
    
    let likes = UILabel()
    let caption = UILabel()
    let viewComment = UILabel()
    let date = UILabel()
    
    let commentView = UIView()
    let accImage = UIImageView()
    let addComment = UILabel()
    let emoji1 = UIImageView()
    let emoji2 = UIImageView()
    let emoji3 = UIImageView()
    
    func setUpTopView(){
        topView.backgroundColor = .white
        
        accountImage.image = UIImage(named: "image28")
        accountImage.contentMode = .scaleAspectFit
        accountImage.clipsToBounds = true
        
        
        accountName.text = "n_i_g_h_t"
        accountName.textColor = .black
        
        
        followButton.configuration = .filled()
        followButton.setTitle("Follow", for: .normal)
        followButton.tintColor = .blue
        
        followButton.addTarget(self, action: #selector(followClicked(_:)), for: .touchUpInside)
    }
    
    func setUpMiddleView(){
        contentView.addSubview(midView)
        midView.addSubview(midImage)
        midImage.clipsToBounds = true
        midImage.contentMode = .scaleAspectFill
        
       
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midImage.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            midView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            midView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            midView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 60),
            midView.heightAnchor.constraint(equalToConstant: 378)
            
        ])
        
        NSLayoutConstraint.activate([
            midImage.leadingAnchor.constraint(equalTo: midView.leadingAnchor),
            midImage.trailingAnchor.constraint(equalTo: midView.trailingAnchor),
            midImage.topAnchor.constraint(equalTo: midView.topAnchor),
            midImage.bottomAnchor.constraint(equalTo: midView.bottomAnchor)
            
        ])
        
    }
    
    func setUpBottomView(){
        
        bottomView.backgroundColor = .white
        
        like.configuration = .borderless()
        comment.configuration = .borderless()
        share.configuration = .borderless()
        save.configuration = .borderless()
        
        like.setImage(UIImage(systemName: "heart")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        like.addTarget(self, action: #selector(liked), for: .touchUpInside)
        
        comment.setImage(UIImage(systemName: "message"), for: .normal)
        comment.configuration?.baseForegroundColor = .black
        
        share.setImage(UIImage(systemName: "paperplane"), for: .normal)
        share.configuration?.baseForegroundColor = .black
        
        save.setImage(UIImage(systemName: "bookmark"), for: .normal)
        save.configuration?.baseForegroundColor = .black
        
        likes.text = "123,45 likes"
        likes.textColor = .black
        
        
        caption.textColor = .lightGray
        
        
        viewComment.text = "View all 173,64 Comments"
        viewComment.textColor = .lightGray
        
        date.text = "24 january 2023"
        date.adjustsFontSizeToFitWidth = true
        date.textColor = .gray
        
        setUpCommentView()
        
    }
    
    @objc func liked(_ sender : UIButton){
  
        
        if sender.imageView?.image == UIImage(systemName: "heart")?.withTintColor(.black,renderingMode: .alwaysOriginal){
            sender.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemPink,renderingMode: .alwaysOriginal), for: .normal)
        }
        else {
            sender.setImage(UIImage(systemName: "heart")?.withTintColor(.black,renderingMode: .alwaysOriginal), for: .normal)
        }
    }
    
    @objc func followClicked(_ sender : UIButton){
        if sender.titleLabel?.text == "Follow"{
            sender.setTitle("Following", for: .normal)
        }
        else{
            sender.setTitle("Follow", for: .normal)
        }
    }
    
    func setUpCommentView(){
        bottomView.addSubview(commentView)
        
        commentView.addSubview(accImage)
        commentView.addSubview(addComment)
        commentView.addSubview(emoji1)
        commentView.addSubview(emoji2)
        commentView.addSubview(emoji3)
        
        accImage.image = accountImage.image
        accImage.contentMode = .scaleAspectFit
        accImage.clipsToBounds = true
        accImage.layer.cornerRadius = 15
        accImage.backgroundColor = .black
        
        addComment.text = "Add a Comment..."
        addComment.textColor = .systemGray3
        
        emoji1.image = UIImage(systemName: "smiley.fill")
        emoji1.tintColor = .systemYellow
        emoji2.image = UIImage(systemName: "hands.clap.fill")
        emoji2.tintColor = .systemYellow
        emoji3.image = UIImage(systemName: "plus")
        emoji3.tintColor = .darkGray
        setUpCommentConstrains()
        
    }
    
    func setupTopViewConstrains(){
        contentView.addSubview(topView)
        topView.addSubview(accountName)
        topView.addSubview(accountImage)
        topView.addSubview(followButton)
        
        topView.translatesAutoresizingMaskIntoConstraints      = false
        accountName.translatesAutoresizingMaskIntoConstraints  = false
        accountImage.translatesAutoresizingMaskIntoConstraints = false
        followButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            accountImage.topAnchor.constraint(equalTo: topView.topAnchor,constant: 5),
            accountImage.leadingAnchor.constraint(equalTo: topView.leadingAnchor,constant: 10),
            accountImage.bottomAnchor.constraint(equalTo: topView.bottomAnchor,constant: -5),
            accountImage.widthAnchor.constraint(equalToConstant: 50),
            accountImage.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            accountName.leadingAnchor.constraint(equalTo: accountImage.trailingAnchor,constant: 5),
            accountName.topAnchor.constraint(equalTo: topView.topAnchor),
            accountName.bottomAnchor.constraint(equalTo: topView.bottomAnchor),
            accountName.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 1/2)
        ])
        
        NSLayoutConstraint.activate([
            followButton.topAnchor.constraint(equalTo: topView.topAnchor,constant: 10),
            followButton.bottomAnchor.constraint(equalTo: topView.bottomAnchor,constant: -10),
            followButton.leadingAnchor.constraint(equalTo: accountName.trailingAnchor,constant: 5),
            followButton.widthAnchor.constraint(equalToConstant: 100)
            
        ])
        
        accountImage.backgroundColor = .black
        accountImage.layer.cornerRadius = 25
        
        
    }
    
    
    func setUpBottomConstrains(){
        contentView.addSubview(bottomView)
        bottomView.addSubview(like)
        bottomView.addSubview(comment)
        bottomView.addSubview(share)
        bottomView.addSubview(save)
        bottomView.addSubview(likes)
        bottomView.addSubview(viewComment)
        bottomView.addSubview(date)
        
        
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        like.translatesAutoresizingMaskIntoConstraints = false
        comment.translatesAutoresizingMaskIntoConstraints = false
        share.translatesAutoresizingMaskIntoConstraints = false
        save.translatesAutoresizingMaskIntoConstraints = false
        likes.translatesAutoresizingMaskIntoConstraints = false
        viewComment.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //topView.topAnchor.constraint(equalTo: contentView.topAnchor),
            bottomView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 190),
            bottomView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            like.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10),
            //like.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
            like.heightAnchor.constraint(equalToConstant: 30),
            like.widthAnchor.constraint(equalToConstant: 30),
            like.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            comment.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10),
           // comment.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
            comment.heightAnchor.constraint(equalToConstant: 30),
            comment.widthAnchor.constraint(equalToConstant: 30),
            comment.leadingAnchor.constraint(equalTo: like.trailingAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            share.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10),
            //share.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
            share.heightAnchor.constraint(equalToConstant: 30),
            share.widthAnchor.constraint(equalToConstant: 30),
            share.leadingAnchor.constraint(equalTo: comment.trailingAnchor,constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            save.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 10),
            //save.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor,constant: -10),
            save.heightAnchor.constraint(equalToConstant: 30),
            save.widthAnchor.constraint(equalToConstant: 30),
            save.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor,constant: -15)
        ])
        

        NSLayoutConstraint.activate([
            likes.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 45),
            likes.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
            likes.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            likes.heightAnchor.constraint(equalToConstant: 30)
        ])

     
        NSLayoutConstraint.activate([
            viewComment.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 75),
            viewComment.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
            viewComment.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            viewComment.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: commentView.bottomAnchor,constant: 10),
            date.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
            date.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            date.heightAnchor.constraint(equalToConstant: 15)
        ])
        
    }
    
    func setUpCommentConstrains(){
        
        commentView.translatesAutoresizingMaskIntoConstraints = false
        accImage.translatesAutoresizingMaskIntoConstraints = false
        addComment.translatesAutoresizingMaskIntoConstraints = false
        emoji1.translatesAutoresizingMaskIntoConstraints = false
        emoji2.translatesAutoresizingMaskIntoConstraints = false
        emoji3.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentView.topAnchor.constraint(equalTo: bottomView.topAnchor,constant: 110),
            commentView.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor,constant: 10),
            commentView.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor),
            commentView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            accImage.topAnchor.constraint(equalTo: commentView.topAnchor,constant: 5),
            accImage.leadingAnchor.constraint(equalTo: commentView.leadingAnchor,constant: 5),
           // accImage.bottomAnchor.constraint(equalTo: commentView.bottomAnchor,constant: -5),
            accImage.widthAnchor.constraint(equalToConstant: 30),
            accImage.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            addComment.leadingAnchor.constraint(equalTo: accImage.trailingAnchor,constant: 10),
            addComment.topAnchor.constraint(equalTo: commentView.topAnchor),
            addComment.bottomAnchor.constraint(equalTo: commentView.bottomAnchor),
            addComment.widthAnchor.constraint(equalTo: commentView.widthAnchor, multiplier: 1/2)
        ])
        
        NSLayoutConstraint.activate([
            emoji1.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            emoji1.widthAnchor.constraint(equalToConstant: 20),
            emoji1.heightAnchor.constraint(equalToConstant: 20),
            emoji1.trailingAnchor.constraint(equalTo: commentView.trailingAnchor,constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            emoji2.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            emoji2.leadingAnchor.constraint(equalTo: emoji1.trailingAnchor,constant: 10),
            //emoji2.bottomAnchor.constraint(equalTo: commentView.bottomAnchor,constant: -5),
            emoji2.widthAnchor.constraint(equalToConstant: 20),
            emoji2.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            emoji3.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            emoji3.leadingAnchor.constraint(equalTo: emoji2.trailingAnchor,constant: 10),
            //emoji3.bottomAnchor.constraint(equalTo: commentView.bottomAnchor,constant: -5),
            emoji3.widthAnchor.constraint(equalToConstant: 20),
            emoji3.heightAnchor.constraint(equalToConstant: 20)
        ])
        
    }
    
    
    func setRandomImage(){
        let images : [UIImage] = [
            UIImage(named: "image1"),
            UIImage(named: "image20"),
            UIImage(named: "image3"),
            UIImage(named: "image4"),
            UIImage(named: "image5"),
            UIImage(named: "image6"),
            UIImage(named: "image7"),
            UIImage(named: "image21"),
            UIImage(named: "image9"),
            UIImage(named: "image10"),
            UIImage(named: "image28"),
            UIImage(named: "image12"),
            UIImage(named: "image13"),
            UIImage(named: "image24"),
            UIImage(named: "image15"),
            UIImage(named: "image16")
        ].compactMap({ $0 })
            
            midImage.image = images.randomElement()
    }
    
    
}

