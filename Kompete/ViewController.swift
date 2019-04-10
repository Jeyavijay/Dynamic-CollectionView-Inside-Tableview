//
//  ViewController.swift
//  Kompete
//
//  Created by Jeyavijay Nedumaran on 4/9/19.
//  Copyright © 2019 Jeyavijay Nedumaran. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {


    @IBOutlet weak var tableViewDashboard: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableViewDashboard.register(UINib(nibName: "TableViewCellDashboard", bundle: nil), forCellReuseIdentifier: "TableViewCellDashboard")
        tableViewDashboard.reloadData()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableViewDashboard.reloadData()
    }
    
    //MARK:- TableView Datasource and Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellDashboard") as! TableViewCellDashboard
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewHeader = UIView()
        viewHeader.backgroundColor = UIColor.green
        return viewHeader
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return UITableView.automaticDimension
    }
}

