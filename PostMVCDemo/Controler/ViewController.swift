//
//  ViewController.swift
//  PostMVCDemo
//
//  Created by User on 31/05/19.
//  Copyright © 2019 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayPost = [Post]()
    
    @IBOutlet weak var postTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let net = NetWorkServices.shared
        net.delegate = self
        NetWorkServices.shared.getArticalData()
        
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.estimatedRowHeight = UITableView.automaticDimension
        
    }
}


extension ViewController: UITableViewDelegate , UITableViewDataSource {
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postTableView.dequeueReusableCell(withIdentifier: PostViewCell.identifier, for: indexPath) as! PostViewCell
        let post = arrayPost[indexPath.row]
        cell.populate(with: post)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController:passdataDelegate{
    
        func passData(ArrayOfPosts: [Post]) {
        print("array is: \n \(ArrayOfPosts)")
        self.arrayPost = ArrayOfPosts
        self.postTableView.reloadData()
    }
}

