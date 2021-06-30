//
//  ViewController.swift
//  Pizza Nice
//
//  Created by fardi Clk on 29/06/2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var chooseBase: UISegmentedControl!
    @IBOutlet weak var addCheese: UISwitch!
    @IBOutlet weak var addChorizo: UISwitch!
    @IBOutlet weak var addSalade: UISwitch!
    @IBOutlet weak var numberStepper: UIStepper!
    @IBOutlet weak var numbersOfPersonLabel: UILabel!
    @IBOutlet weak var timeCookingLabel: UILabel!
    @IBOutlet weak var changeTimeSlider: UISlider!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
    }
    
    // MARK: - Setup Button
    
    private func setupButton() {
        purchaseButton.layer.cornerRadius = 30
        //purchaseButton.isEnabled = false
        purchaseButton.backgroundColor = UIColor.init(red: 170/250, green: 170/250, blue: 170/250, alpha: 0.5)
    }
    
    private func setupTextField() {
        nameTextField.delegate = self
        // Si on clique sur return, le clavier se cache
        // Si on clique sur l'écran le clavier se cache
        
    }
    
    
    // MARK: - Actions
    
    @IBAction func chooseBaseSegmented(_ sender: UISegmentedControl) {
        // Si le segment passe à droite, le titre = Crème
        // Le prix de la pizza reste à 8€
        // Si non, le titre = Tomates et le prix reste à 8€
    }
    
    @IBAction func addCheeseSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 1,90€ dans le prix total
    }
    
    @IBAction func addChorizoSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 0,90€ dans le prix total
    }
    
    @IBAction func addSaladeSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 2,10€ dans le prix total
    }
    
    @IBAction func numberOfPersonTapped(_ sender: UIStepper) {
        // Si le Stepper +, On augmente le nombre de Personnes de 1
        // Si le Stepper -, On diminu le nombre de Personnes de 1
        // Si le nombre de personne augmente, Le prix est multiplié par le nombre de personne
        // Si le nombre de personne diminu, Le prix est divisé par le nombre de personne
    }
    
    @IBAction func timeCookingSlided(_ sender: UISlider) {
        // Si le Slider passe vers les positif, le temps de cuisson augmente,
        // Si le Slider passe vers le négatif, le temps de cuisson diminue
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        // On affiche le message,
        // Si non, ouvrir une nouvelle page et afficher le message :
        print("Merci pour votre commande \(nameTextField.text ?? "Personne") !\n\n"
                + "Base : \(chooseBase.titleForSegment(at: 0)!) \n"
                + "Fromage : \(addCheese.isOn ? "OUI" : "NON") \n"
                + "Chorizo : \(addChorizo.isOn ? "OUI" : "NON") \n"
                + "Salade : \(addSalade.isOn ? "OUI" : "NON") \n"
                + "Part(s) : \("Nombre de part") \n"
                + "Temps de cuisson : \(timeCookingLabel.text ?? "0 min") \n\n"
                + "=> Prix total : \(priceLabel.text ?? "0.00€")")
    }
    
}

