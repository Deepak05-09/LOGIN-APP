//
//  ReelsController.swift
//  LOGIN-APP
//
//  Created by deepak-pt6306 on 12/04/23.
//

import UIKit

class ReelsController: UIViewController {
    
    let data : [UIImage] = {
        var data : [UIImage] = []
        for i in 17...28{
            data.append(UIImage(named: "image\(i)")!)
        }
        return data
    }()

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .white
        
        tableView.register(ReelsVideo.self, forCellReuseIdentifier: ReelsVideo.identifier)
        setUpTableView()
        
        
    }
    
    func  setUpTableView(){
        
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isPagingEnabled = true
        tableView.separatorColor = .black
        view.addSubview(tableView)
        
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
    }
    

   

}

extension ReelsController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ReelsVideo.identifier, for: indexPath) as! ReelsVideo
        cell.reelsImage.image = data.randomElement()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height
    }
    
    
    
}

extension ReelsController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

