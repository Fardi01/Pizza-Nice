//
//  PizzaCell.swift
//  Pizza Nice
//
//  Created by fardi Clk on 03/07/2021.
//

import UIKit

class PizzaCell: UITableViewCell {
    @IBOutlet weak var TitleLabel: UILabel!
    
    var TitrePizza : [String] = ["Margerita", "Classic", "Orientale", "Cannibale", "Regina", "Calzone", "Montagnard", "Poulet" ]
    
    var prixPizza : [Double] = [10.00, 8.90, 14.00, 12.00, 11.00, 15.00, 13.00, 10.00]
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
