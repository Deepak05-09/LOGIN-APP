//
//  Search.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit


struct ApiResponse : Codable {
    let total : Int
    let total_pages : Int
    let results : [Result]
}

struct Result : Codable {
    let id : String
    let urls : URLS
}

struct URLS : Codable {
    let small : String
    let full : String
}

class Search: UIViewController {
    
    
   var results : [Result] = []

    private let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createLayout()
        
        
    )
    let searchBar = UISearchBar()
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        setCollectionView()
//        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressAction(_:)))
//        collectionView.addGestureRecognizer(gesture)
      
    }
    
    func setCollectionView(){
        view.addSubview(collectionView)
        collectionView.register(CoustomCell.self, forCellWithReuseIdentifier: CoustomCell.identifier)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setSearchBar(){
        view.addSubview(searchBar)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search here"
        searchBar.barTintColor = .red
        searchBar.delegate = self
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
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
    
    
    func fetchPhotos(query : String ){
        let StringUrl = "https://api.unsplash.com/search/photos?page=1&per_page=30&query=\(query)&client_id=WZ3zmr7KXhXD76M1nTpcO1p3zqkw6vzWZ3DhFE_a1Pk"
        guard let url = URL(string: StringUrl) else { return }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data ,_,error in
            guard let data = data , error == nil else { return }
            
            do {
                let jsonResult = try JSONDecoder().decode(ApiResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView.reloadData()
                }
                
            }catch {
                print(error)
            }
        }
        task.resume()
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

extension Search : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            results = []
            collectionView.reloadData()
            fetchPhotos(query: text)
        }
    }
}

extension Search : UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let  imageUrl = results[indexPath.row].urls.full
        print(imageUrl)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoustomCell.identifier, for: indexPath) as! CoustomCell
        cell.configure(with: imageUrl)
        return cell
    }
    
    
}

extension Search : UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("selected")
        
        collectionView.deselectItem(at: indexPath, animated: true)
        let cell = collectionView.cellForItem(at: indexPath) as! CoustomCell
        
        let detailView = DetailViewController()
        detailView.setImage(image: cell.imageView.image!)
        
       // let nc = UINavigationController(rootViewController: detailView )
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

