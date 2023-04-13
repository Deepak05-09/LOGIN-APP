//
//  PostController.swift
//  CollectionView
//
//  Created by deepak-pt6306 on 28/02/23.
//

import UIKit

class HomeController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        tableView.register(Post.self, forCellReuseIdentifier: Post.identifier)
        setUpTableView()
        
        
    }
    
    func  setUpTableView(){
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 628
        tableView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        tableView.separatorColor = .black
        view.addSubview(tableView)
    }
    

   

}

extension HomeController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Post.identifier, for: indexPath)
        
        return cell
    }
    
    
    
}

extension HomeController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

