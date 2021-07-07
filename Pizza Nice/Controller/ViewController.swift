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
    @IBOutlet weak var cheeseSwitch: UISwitch!
    @IBOutlet weak var chorizoSwitch: UISwitch!
    @IBOutlet weak var saladeSwitch: UISwitch!
    @IBOutlet weak var numberOfPersonStepper: UIStepper!
    @IBOutlet weak var numberOfPersonLabel: UILabel!
    @IBOutlet weak var timeCookingLabel: UILabel!
    @IBOutlet weak var timeCookingSlider: UISlider!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var purchaseButton: UIButton!
    
    var thePizzaName = ""
    
    var prixPizza: Double = 0.00
    var prixTotal: Double = 0.00
    var prixUnitaire: Double = 0.00
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButton()
        setupTextField()
        desableSwitch()
        updatePrice()
    }
    
     
    // MARK: - Setup textField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty {
            purchaseButton.isEnabled = true
            purchaseButton.backgroundColor = UIColor.init(red: 78/250, green: 208/250, blue: 92/250, alpha: 1)
        } else {
            purchaseButton.isEnabled = false
            purchaseButton.backgroundColor = UIColor.init(red: 170/250, green: 170/250, blue: 170/250, alpha: 1)
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupTextField() {
        nameTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        nameTextField.resignFirstResponder()
    }
    
    
    // MARK: - Actions
    
    @IBAction func chooseBaseSegmented(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func addCheeseSwitched(_ sender: UISwitch) {
        updatePrice()
    }
    
    @IBAction func addChorizoSwitched(_ sender: UISwitch) {
        updatePrice()
    }
    
    @IBAction func addSaladeSwitched(_ sender: UISwitch) {
        updatePrice()
    }
    
    @IBAction func numberOfPersonTapped(_ sender: UIStepper) {
        numberOfPerson()
        updatePrice()
    }
    
    @IBAction func timeCookingSlided(_ sender: UISlider) {
        cookingTime()
    }
    
    @IBAction func purchaseButtonTapped(_ sender: UIButton) {
        purchase()
    }
    
    // Private func
    private func setupButton() {
        purchaseButton.layer.cornerRadius = 30
        purchaseButton.isEnabled = false
        purchaseButton.backgroundColor = UIColor.init(red: 170/250, green: 170/250, blue: 170/250, alpha: 0.5)
    }
    
    private func addBase() {
        if chooseBase.selectedSegmentIndex == 0 {
            print(chooseBase.titleForSegment(at: 0)!)
        } else {
            print(chooseBase.titleForSegment(at: 1)!)
        }
    }
    
    private func desableSwitch() {
        cheeseSwitch.isOn = false
        chorizoSwitch.isOn = false
        saladeSwitch.isOn = false
    }
    
    private func numberOfPerson() {
        if numberOfPersonStepper.value != 1 {
            numberOfPersonLabel.text = (Int(numberOfPersonStepper.value).description + " personnes")
        } else {
            numberOfPersonLabel.text = (Int(numberOfPersonStepper.value).description + " personne")
        }
        updatePrice()
    }
    
    private func cookingTime() {
        timeCookingLabel.text = "Temps de cuisson : \(Int(timeCookingSlider.value).description) min"
    }
    
    func updatePrice() {
        //var totalPrice: Double = 8.00
        var monprix = prixPizza
        
        if cheeseSwitch.isOn {
            monprix += 1.90
        }
        
        if chorizoSwitch.isOn {
            monprix += 0.90
        }
        
        if saladeSwitch.isOn {
            monprix += 2.10
        }
        // multiplier les personnes
        monprix = monprix * numberOfPersonStepper.value
        monprix = round(monprix * 10) / 10
        prixUnitaire = round(prixUnitaire * 10) / 10
        
        totalPriceLabel.text = "Prix total : \(monprix)0€"
        prixTotal = monprix + monprix * 0.21
        prixTotal = round(prixTotal * 10) / 10
        prixUnitaire = monprix
    }
    
    
    // MARK: - Purchase button
    private func purchase() {
        performSegue(withIdentifier: "recap", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let recapViewController = segue.destination as! RecapViewController
        recapViewController.nameText = nameTextField.text!
        recapViewController.cheese = cheeseSwitch.isOn ? "OUI ✅" : "NON ❌"
        recapViewController.chorizo = chorizoSwitch.isOn ? "OUI ✅" : "NON ❌"
        recapViewController.salade = saladeSwitch.isOn ? "OUI ✅" : "NON ❌"
        recapViewController.cookingTime = timeCookingLabel.text!
        recapViewController.numberOfPerson = numberOfPersonLabel.text!
        recapViewController.unitPrice = String(prixUnitaire)
        recapViewController.totalPrice = String(prixTotal)
        recapViewController.pizzaName = thePizzaName
        print(thePizzaName)
    }
    
}


