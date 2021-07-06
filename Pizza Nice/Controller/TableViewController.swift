//
//  TableViewController.swift
//  Pizza Nice
//
//  Created by fardi Clk on 03/07/2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var viewController = ViewController()

    @IBOutlet weak var Pizza1: PizzaCell!
    @IBOutlet weak var TitlePizza: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Pizza1.tag = 1
        print(TitlePizza.text ?? "nul")

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("La section est : \(indexPath.section)")
    }

    
}
