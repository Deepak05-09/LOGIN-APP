//
//  CoustomCell.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit

class CoustomCell: UICollectionViewCell {
    
    static let identifier = "Cell"
    
    private var imageUrl: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        addSubview(activityIndicator)
        activityIndicator.hidesWhenStopped = true
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
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
    
    let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        return indicator
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
        activityIndicator.center = contentView.center
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        imageView.layer.borderWidth = 1
        activityIndicator.stopAnimating()
        imageUrl = nil
    }
    
    func configure(with urlString: String) {
        imageUrl = urlString
        activityIndicator.startAnimating()
        
        guard let imageUrl = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: imageUrl) { [weak self] data, _, error in
            guard let self = self, let data = data, self.imageUrl == urlString else {
                return
            }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
                self.imageView.layer.borderWidth = 0
                self.activityIndicator.stopAnimating()
            }
        }
        task.resume()
    }
}
