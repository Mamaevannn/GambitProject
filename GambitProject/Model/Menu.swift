//
//  Model.swift
//  GambitProject
//
//  Created by Наида Мамаева on 11.03.2022.
//

import Foundation
import UIKit

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
                
        else {return nil}
        
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.oldPrice = oldPrice
        self.description = description
    }
    
    func saveCount() {
        UserDefaults.standard.setValue(isFavorite, forKey: "favAction")
        isFavorite = UserDefaults.standard.bool(forKey: "favAction")
    }
    
    static func generateData() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        appDelegate.saveContext()
    }
}


