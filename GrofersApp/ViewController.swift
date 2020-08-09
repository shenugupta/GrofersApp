//
//  ViewController.swift
//  GrofersApp
//
//  Created by Shenu Gupta on 08/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "AdvertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementTableViewCell")
         tableView.register(UINib.init(nibName: "DummyCellTableViewCell", bundle: nil), forCellReuseIdentifier: "DummyCellTableViewCell")
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell", for: indexPath)
        return cell
        
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let custumHeader = tableView.dequeueReusableCell(withIdentifier: "DummyCellTableViewCell") as! DummyCellTableViewCell
        return custumHeader
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 260.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
}

