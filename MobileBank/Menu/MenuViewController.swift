//
//  MenuViewController.swift
//  MobileBank
//
//  Created by Tamas Ondresik
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let menuItems = ["Accounts", "Transactions", "Payment"]
    let rowHeight:CGFloat = 50
    let menuCellId = "menuCell"
    
    @IBOutlet weak var menuTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.tableFooterView = UIView(frame: CGRect.zero)
        menuTableView.separatorColor = UIColor.clear
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        menuTableView.sizeToFit()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: menuCellId) as! MenuTableViewCell
        
        let menuItem:String = menuItems[indexPath.row]
        
        cell.menuCellLabel.text = menuItem
        cell.menuCellImage.image = UIImage(named: menuItem)
        
        cell.menuCellView.layer.cornerRadius = cell.menuCellView.frame.height/4
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowIndex = indexPath.row
        let segueId = menuItems[rowIndex]
        
        performSegue(withIdentifier: segueId, sender: self)
        
    }

    @IBAction func logOut(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginViewController, animated: true, completion: nil)
    }
    
}
