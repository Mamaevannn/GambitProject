//
//  Model.swift
//  GambitProject
//
//  Created by Наида Мамаева on 11.03.2022.
//

import Foundation

class Menu {
    var id: Int
    var name: String
    var image: String
    var price: Int
    var oldPrice: Int
    var description: String
    var isFavorite: Bool?
    struct nutritionFacts {
        var weight: Int
        var calories: Int
        var protein: Int
        var fat: Int
        var carbohydrates: Int
        
        init?(dict: [String: AnyObject]) {
            guard let weight = dict["weight"] as? Int,
                  let calories = dict["calories"] as? Int,
                  let protein = dict["protein"] as? Int,
                  let fat = dict["fat"] as? Int,
                  let carbohydrates = dict["carbohydrates"] as? Int
            else {return nil}
            self.weight = weight
            self.calories = calories
            self.protein = protein
            self.fat = fat
            self.carbohydrates = carbohydrates
            
            
        }
    }
    
    init?(dict: [String: AnyObject]) {
        guard let id = dict["id"] as? Int,
              let name = dict["name"] as? String,
              let image = dict["image"] as? String,
              let price = dict["price"] as? Int,
              let oldPrice = dict["oldPrice"] as? Int,
              let description = dict["description"] as? String
//              let isFavorite = dict["null"] as? Bool
                
                
        else {return nil}
        
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.oldPrice = oldPrice
        self.description = description
    }
    
    func setFavorite() -> Bool {
        if isFavorite == true {
            return true
        } else {
            return false
        }
    }
    
}


