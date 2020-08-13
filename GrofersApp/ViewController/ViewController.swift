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
    var groferViewModel = GrofersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.register(UINib.init(nibName: "AdvertisementTableViewCell", bundle: nil), forCellReuseIdentifier: "AdvertisementTableViewCell")
        tableView.register(UINib.init(nibName: "DummyCellTableViewCell", bundle: nil), forCellReuseIdentifier: "DummyCellTableViewCell")
        fetchAdvertismentData()
        fetchMilkData()
        fetchCategoryData()
        fetchOtherData()
        // Do any additional setup after loading the view.
    }
    
    
    func fetchMilkData() {
        do{
            try groferViewModel.fetchAllMilkData()
        }
        catch {
            let alert = UIAlertController(title: "Alert", message: "Unable to fetch data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        self.reloadAllMilkList()
    }
    
    func fetchAdvertismentData() {
        do {
            try groferViewModel.fetchAdvertismentData()
        }
        catch {
            let alert = UIAlertController(title: "Alert", message: "Unable to fetch data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        self.reloadAdvertisementList()
    }
    
    func fetchCategoryData() {
        do {
            try groferViewModel.fetchCategoriesList()
        }
        catch {
            let alert = UIAlertController(title: "Alert", message: "Unable to fetch data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        self.reloadCategoriesList()
    }
    
    func fetchOtherData() {
        do {
            try groferViewModel.otherCategoriesList()
        }
        catch {
            let alert = UIAlertController(title: "Alert", message: "Unable to fetch data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        self.reloadOtherCategoriesList()
    }
    
    func reloadAllMilkList() {
        groferViewModel.reloadMilkList = {[weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func reloadCategoriesList() {
        groferViewModel.reloadCategoriesList = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func reloadOtherCategoriesList() {
        groferViewModel.reloadOtherCategoriesList = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    func reloadAdvertisementList() {
        groferViewModel.reloadAdvertismentList = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return GrofersCategories.allCases.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell", for: indexPath) as! AdvertisementTableViewCell
        if indexPath.row == GrofersCategories.Adverstisements.rawValue {
            if let advertisementItems = groferViewModel.advertisementItems {
              cell.updateAdvertisementCellWith(advertisementArr:advertisementItems)
         }
        }
        if indexPath.row == GrofersCategories.AllMilks.rawValue {
            if let milkItems = groferViewModel.milkItems {
            cell.updateAllMilkCellWith(allMilkArr: milkItems)
         }
        }
        else if indexPath.row == GrofersCategories.Categories.rawValue {
                if let categories = groferViewModel.categoryItems {
            cell.updateCategoryCellWith(categoryArr: categories)
        }
      }
        else if indexPath.row == GrofersCategories.DealOfTheDay.rawValue {
          if let advertisementItems = groferViewModel.advertisementItems {
            cell.updateAdvertisementCellWith(advertisementArr: advertisementItems)
         }
        }
        else{
         if let otherCategories = groferViewModel.otherCategoriesItems {
            cell.updateOtherCategoryWith(otherCategoryArr: otherCategories)
        }
      }
        
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

