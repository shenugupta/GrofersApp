//
//  GrofersViewModel.swift
//  GrofersApp
//
//  Created by Shenu Gupta on 10/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import UIKit

enum GrofersCategories {
    case Adverstisements
    case AllMilks
    case Categories
    case DealOfTheDay
    case otherCategory
}

class GrofersViewModel {
    
    var reloadMilkList = {() -> () in }
    var reloadAdvertismentList = {() -> () in }
    var reloadCategoriesList = { () -> () in }
    var reloadOtherCategoriesList = { () -> () in }
    
    var milkItems: AllMilk? = nil {
        didSet {
            
        }
    }
    

    
    
    

}
