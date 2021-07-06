//
//  RecapViewController.swift
//  Pizza Nice
//
//  Created by fardi Clk on 06/07/2021.
//

import UIKit

class RecapViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pizzaNameLabel: UILabel!
    @IBOutlet weak var addCheeseLabel: UILabel!
    @IBOutlet weak var addChorizoLabel: UILabel!
    @IBOutlet weak var addSaladeLabel: UILabel!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var numberOfPersonLabel: UILabel!
    @IBOutlet weak var UnitPriceLabel: UILabel!
    @IBOutlet weak var totalPriceLable: UILabel!
    @IBOutlet weak var closeButton: UIButton!
    
    var nameText = ""
    var pizzaName = ""
    var cheese = ""
    var chorizo = ""
    var salade = ""
    var cookingTime = ""
    var numberOfPerson = ""
    var unitPrice = ""
    var totalPrice = ""
    
    
    var viewController = ViewController()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        updateButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameLabel.text = "Nous avons bien reçu votre commande, \(nameText) 🎉!"
        #warning("Rajouter le nom de la pizza")
        addCheeseLabel.text = "Supplément Fromage : \(cheese)"
        addChorizoLabel.text = "Supplément Chorizo : \(chorizo)"
        addSaladeLabel.text = "Supplément Salade : \(salade)"
        cookingTimeLabel.text = cookingTime
        numberOfPersonLabel.text = "Nombre de personne : \(numberOfPerson)"
        UnitPriceLabel.text = "\(unitPrice)0€"
        totalPriceLable.text = "\(totalPrice)€"
    }

    // MARK: - Actions
    
    private func updateButton() {
        closeButton.layer.cornerRadius = 20
    }
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        #warning("Revenir au menu principal")
        
    }

}
