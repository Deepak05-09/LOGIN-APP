//
//  ReelsVideo.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit

class ReelsVideo: UITableViewCell {

    static let identifier = "ReelsVideo"
    
    let reelsImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image23")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let stackView : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let likeButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.setImage(UIImage(systemName: "heart")?.withTintColor(.white,renderingMode: .alwaysOriginal), for: .normal)
       // button.setImage(UIImage(systemName: "heart.fill")?.withTintColor(.systemPink), for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let commentButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.setImage(UIImage(systemName: "message")?.withTintColor(.white,renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let shareButton : UIButton = {
        let button = UIButton()
        button.configuration = .borderless()
        button.setImage(UIImage(systemName: "paperplane")?.withTintColor(.white,renderingMode: .alwaysOriginal), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let topView = UIView()
    let accountImage = UIImageView()
    let accountName = UILabel()
    let followButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        
        contentView.addSubview(reelsImage)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(likeButton)
        stackView.addArrangedSubview(commentButton)
        stackView.addArrangedSubview(shareButton)
        
        
        NSLayoutConstraint.activate([
            reelsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            reelsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            reelsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reelsImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            stackView.topAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 200),
            stackView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
