//
//  AdvertisementTableViewCell.swift
//  GrofersApp
//
//  Created by Shenu Gupta on 09/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import UIKit

class AdvertisementTableViewCell: UITableViewCell {
   
    @IBOutlet weak var advertismentCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.advertismentCollectionView.register(UINib.init(nibName: "AdvertismentCollectionCell", bundle: nil), forCellWithReuseIdentifier: "AdvertismentCollectionCell")
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
}

extension AdvertisementTableViewCell: UICollectionViewDataSource,UICollectionViewDelegate {
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return 5
    
        }
    
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 0
        }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertismentCollectionCell", for: indexPath)
            return cell
        }
}


    

