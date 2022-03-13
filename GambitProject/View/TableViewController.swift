//
//  TableViewController.swift
//  GambitProject
//
//  Created by Наида Мамаева on 11.03.2022.
//

import UIKit
import SwipeCellKit

class TableViewController: UITableViewController {

    
    var menuPosition = [Menu]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.delegate = self
//        tableView.dataSource = self
        addImageToNavBar()
        MenuNetworkService.getMenu { (response) in
            self.menuPosition = response.menuPosition
            self.tableView.reloadData()
        }

    }

    // кастомим navigationBar
    func addImageToNavBar() {
        if let navController = navigationController {
            let imageLogo = #imageLiteral(resourceName: "image")
            let widthNavBar = navController.navigationBar.frame.width
            let heigthNavBar = navController.navigationBar.frame.height
            
            let widthForView = widthNavBar * 0.4
            
            let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heigthNavBar))
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: widthForView, height: heigthNavBar))
            imageView.image = imageLogo
            imageView.contentMode = .scaleAspectFit
            logoContainer.addSubview(imageView)
            
            navigationItem.titleView = logoContainer

        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuPosition.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let menu = menuPosition[indexPath.row]
        cell.configure(with: menu)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .none {
            }
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = setFavorite(at: indexPath)
        
        return UISwipeActionsConfiguration(actions: [favorite])
    }
    
    func setFavorite(at indexPath: IndexPath) -> UIContextualAction {
        let object = menuPosition[indexPath.row]
        
        let favoriteAction = UIContextualAction(style: .normal, title: "") {(action, view, completionHandler) in
            object.isFavorite = !(object.isFavorite ?? false)
            self.menuPosition[indexPath.row] = object
            completionHandler(true)
        }
        favoriteAction.image = object.isFavorite ?? false  ? #imageLiteral(resourceName: "isFavorite") : #imageLiteral(resourceName: "isNotFavorite")
        favoriteAction.backgroundColor = #colorLiteral(red: 0.918249011, green: 0.9182489514, blue: 0.9182489514, alpha: 1)
        return favoriteAction
    }
                
    
}


