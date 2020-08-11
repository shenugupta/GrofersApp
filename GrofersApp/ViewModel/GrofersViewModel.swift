//
//  GrofersViewModel.swift
//  GrofersApp
//
//  Created by Shenu Gupta on 10/08/20.
//  Copyright © 2020 Shenu Gupta. All rights reserved.
//

import UIKit

enum GrofersCategories: Int,CaseIterable {
    case Adverstisements = 0
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
    
    var milkItems: [AllMilk]? = nil {
        didSet {
            self.reloadMilkList()
        }
    }
        
        
    var advertisementItems: [AdvertismentModel]? = nil {
           didSet {
            self.reloadAdvertismentList()
           }
        }
    
    var categoryItems: [CategoriesModel]? = nil {
        didSet {
            self.reloadCategoriesList()
        }
    }
    
    var otherCategoriesItems: [OtherCategoriesModel]? = nil {
        didSet {
            self.reloadOtherCategoriesList()
        }
    }
        
 
    func fetchAllMilkData() throws {
        var allMilkData: [AllMilk]? = []
        allMilkData?.append(AllMilk(milkName: "Amul", milkType: "Amul", milkPrice: "32", milkQty: 500, imageURL: "image1"))
        allMilkData?.append(AllMilk(milkName: "Dodla", milkType: "Dodla", milkPrice: "50", milkQty: 1000, imageURL: "image1"))
        allMilkData?.append(AllMilk(milkName: "Samrudhi", milkType: "Samrudhi", milkPrice: "32", milkQty: 500, imageURL: "image1"))
        allMilkData?.append(AllMilk(milkName: "Nandini", milkType: "Nandini", milkPrice: "40", milkQty: 1000, imageURL: "image1"))
        allMilkData?.append(AllMilk(milkName: "Dodla", milkType: "Dodla", milkPrice: "26", milkQty: 500, imageURL: "image1"))
        self.milkItems = allMilkData
    }


func fetchCategoriesList() throws {
    var allCategoriesData: [CategoriesModel] = []
    allCategoriesData.append(CategoriesModel(imageUrl: "image1", milkName: "Amul"))
    allCategoriesData.append(CategoriesModel(imageUrl: "image1", milkName: "Amul"))
    allCategoriesData.append(CategoriesModel(imageUrl: "image1", milkName: "Amul"))
    allCategoriesData.append(CategoriesModel(imageUrl: "image1", milkName: "Amul"))
    allCategoriesData.append(CategoriesModel(imageUrl: "image1", milkName: "Amul"))
    self.categoryItems = allCategoriesData

}
    func fetchAdvertismentData() throws {
        var advertisementData: [AdvertismentModel] = []
        advertisementData.append(AdvertismentModel(imageUrl: "image1"))
        advertisementData.append(AdvertismentModel(imageUrl: "image1"))
        advertisementData.append(AdvertismentModel(imageUrl: "image1"))
        advertisementData.append(AdvertismentModel(imageUrl: "image1"))
        advertisementData.append(AdvertismentModel(imageUrl: "image1"))
        self.advertisementItems = advertisementData
    }
    
    func otherCategoriesList() throws {
        var otherCategoriesData: [OtherCategoriesModel] = []
        otherCategoriesData.append(OtherCategoriesModel(imageUrl: "image1"))
        otherCategoriesData.append(OtherCategoriesModel(imageUrl: "image2"))
        otherCategoriesData.append(OtherCategoriesModel(imageUrl: "image3"))
        otherCategoriesData.append(OtherCategoriesModel(imageUrl: "image4"))
        otherCategoriesData.append(OtherCategoriesModel(imageUrl: "image5"))
    }
}

