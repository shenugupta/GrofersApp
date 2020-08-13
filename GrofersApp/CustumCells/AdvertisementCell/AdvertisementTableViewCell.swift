//
//  AdvertisementTableViewCell.swift
//  GrofersApp
//
//  Created by Shenu Gupta on 09/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var advertismentArr: [AdvertismentModel]?
    var allMilkArr: [AllMilk]?
    var categoryArr: [CategoriesModel]?
    var otherCategoryArr: [OtherCategoriesModel]?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.register(UINib.init(nibName: "AdvertismentCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AdvertismentCollectionCell")
         self.collectionView.register(UINib.init(nibName: "AllMilkCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "AllMilkCollectionViewCell")
         self.collectionView.register(UINib.init(nibName: "CategoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesCollectionViewCell")
        self.collectionView.register(UINib.init(nibName: "AdvertismentCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AdvertismentCollectionCell")
        self.collectionView.reloadData()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}

extension AdvertisementTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func updateAllMilkCellWith(allMilkArr: [AllMilk]) {
        self.allMilkArr = allMilkArr
        self.collectionView.reloadData()
    }
    
    func updateCategoryCellWith(categoryArr: [CategoriesModel]) {
        self.categoryArr = categoryArr
        self.collectionView.reloadData()
    }
    
    func updateAdvertisementCellWith(advertisementArr: [AdvertismentModel]){
        self.advertismentArr = advertisementArr
        self.collectionView.reloadData()
    }
    
    func updateOtherCategoryWith(otherCategoryArr: [OtherCategoriesModel]) {
        self.otherCategoryArr = otherCategoryArr
        self.collectionView.reloadData()
    }
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       var numberOfItems : Int? = 0
        if let milkArr = self.allMilkArr {
           numberOfItems = milkArr.count
        }
        if let categoryArr = self.categoryArr {
          numberOfItems = categoryArr.count
        }
        if let advertismentArr = self.advertismentArr {
            numberOfItems = advertismentArr.count
        }
        if let otherCategoryArr = self.otherCategoryArr {
            numberOfItems = otherCategoryArr.count
        }
        return numberOfItems ?? 0
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           
            if let advertismentArr = self.advertismentArr {
                      if advertismentArr.count > 0 {
                          let advertismentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertismentCollectionCell", for: indexPath)
                          return advertismentCell
                }
            }
            if let milkArr = self.allMilkArr {
            if milkArr.count > 0 {
             let allMilkCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllMilkCollectionViewCell", for: indexPath)
             return allMilkCell
            }
         }
            if let categoryArr = self.categoryArr {
            if categoryArr.count > 0 {
                let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesCollectionViewCell", for: indexPath)
                return categoryCell
            }
         }
         
        if let otherCategoryArr = self.otherCategoryArr {
            if otherCategoryArr.count > 0 {
                let advertismentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertismentCollectionCell", for: indexPath)
                return advertismentCell
            }
          }
            return UICollectionViewCell()
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width-120, height: collectionView.frame.size.height)
    }
}


    

