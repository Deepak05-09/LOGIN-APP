//
//  Search.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit
import UIKit

@available(iOS 16.0, *)
@available(iOS 16.0, *)
class Search: UIViewController {

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
        
        
    )
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
        view.addSubview(collectionView)
        collectionView.register(CoustomCell.self, forCellWithReuseIdentifier: CoustomCell.identifier)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        
//        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
//        collectionView.addGestureRecognizer(gesture)
    }
    
    func setSearchController(){
        searchController.showsSearchResultsController = true
        navigationItem.searchController = searchController
        searchController.becomeFirstResponder()
    }
    
    
   static func createLayout()-> UICollectionViewCompositionalLayout {
        //Item
       let item = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2/3),
            heightDimension: .fractionalHeight(1))
       )
       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
       
       let verticalStackItem = NSCollectionLayoutItem(
        layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5))
        )
      verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
       
       let tripletItem = NSCollectionLayoutItem(
        layoutSize:  NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1))
       )
        
       tripletItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
       
       //Group
       let verticalStackGroup = NSCollectionLayoutGroup.vertical(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1)),
        repeatingSubitem: verticalStackItem,
        count: 2)
       
       let tripletHG = NSCollectionLayoutGroup.horizontal(
        layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(0.3)),
        repeatingSubitem: tripletItem,
        count: 3)
       
       let Horizontalgroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.7)),
        subitems: [item,verticalStackGroup]
        )
       
       let verticalgroup = NSCollectionLayoutGroup.vertical(
        layoutSize:  NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(3/5)),
        subitems: [Horizontalgroup,tripletHG])
       
       //section
       let section = NSCollectionLayoutSection(group:verticalgroup)
       
       return UICollectionViewCompositionalLayout(section: section)
   }
    
    
    
   
    @objc func longPressAction(_ gesture : UILongPressGestureRecognizer){
       
        switch gesture.state{
        case .began :
            guard let indexpath = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else {
                return
            }
            collectionView.beginInteractiveMovementForItem(at: indexpath)
        case .changed : collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: collectionView))
        case .ended : collectionView.endInteractiveMovement()
        default :  collectionView.cancelInteractiveMovement()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
//    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        <#code#>
//    }
}

extension Search : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoustomCell.identifier, for: indexPath) as! CoustomCell
        return cell
    }
    
    
}

extension Search : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let cell = collectionView.cellForItem(at: indexPath) as! CoustomCell
        
        let detailView = DetailViewController()
        detailView.setImage(image: cell.imageView.image!)
        
        //let nc = UINavigationController(rootViewController: detailView )
        navigationController?.pushViewController(detailView, animated: true)
    }
    
}

class DetailViewController : UIViewController{
    
    var imageView : UIImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpImage()
    }
    
    
    func setUpImage(){
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = view.bounds
        view.backgroundColor = .systemBackground
    }
    
    func setImage(image: UIImage) {
        self.imageView.image = image
    }
}

