//
//  ViewController.swift
//  TableViewInsideTableView
//
//  Created by Shashank Panwar on 16/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    struct CellData {
        var opened = Bool()
        var title = String()
        var sectionData = [String]()
    }

    @IBOutlet weak var baseTableView: UITableView!
    var tableViewData = [CellData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [CellData(opened: false, title: "Fruits", sectionData: ["Apple", "Mangoes"]), CellData(opened: false, title: "Vegetables", sectionData: ["Potato", "Lady Finger", "Tomato"])]
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTV", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        }
        else {
            //use different cell identifier if needed
            let cell = tableView.dequeueReusableCell(withIdentifier: "BaseTV", for: indexPath)
            cell.textLabel?.text = tableViewData[indexPath.section].sectionData[indexPath.row - 1]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                
                let section = IndexSet(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
            else {
                tableViewData[indexPath.section].opened = true
                
                let section = IndexSet(integer: indexPath.section)
                tableView.reloadSections(section, with: .none)
            }
        }
    }
}
