//
//  CoustomCell.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit

class CoustomCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        let images : [UIImage] = {
            var data : [UIImage] = []
            for i in 1...28{
                data.append(UIImage(named: "image\(i)")!)
            }
            return data
        }()
            
            imageView.image = images.randomElement()
            contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    
}



