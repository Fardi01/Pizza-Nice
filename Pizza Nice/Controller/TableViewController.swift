//
//  TableViewController.swift
//  Pizza Nice
//
//  Created by fardi Clk on 03/07/2021.
//

import UIKit

class TableViewController: UITableViewController {
    @IBOutlet var PizzaTapped: [PizzaCell]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    

    // MARK: - Pass data to supplement window
    
    private func goToSecond() {
        performSegue(withIdentifier: "supplement", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            //let selectedRow = indexPath.row
            let viewController = segue.destination as! ViewController
            let myPizzas = PizzaTapped[indexPath.row].TitrePizza[indexPath.row]
            let pizzaPrice = PizzaTapped[indexPath.row].prixPizza[indexPath.row]
            viewController.thePizzaName = myPizzas
            viewController.prixPizza = pizzaPrice
            
        }
        
    }

}
