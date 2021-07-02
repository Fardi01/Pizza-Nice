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
    
    var totalPrice: Double = 8.00
    var oldValue: Int!
    var prix: Double = 0.00

    var textPrice: String {
        return String(prixTotal) + "0€"
    }
    
    var prixTotal: Double {
        return totalPrice - totalPrice + prix
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numberStepper.minimumValue = 1
        numbersOfPersonLabel.text = Int(numberStepper.value).description + " personne"
        oldValue = Int(numberStepper.minimumValue)
        
        
        
        setupButton()
        setupTextField()
        priceLabel.text = textPrice
        
        // Desable Switcher
        addCheese.isOn = false
        addChorizo.isOn = false
        addSalade.isOn = false
        
    }
    
    // MARK: - Setup Button
    
    private func setupButton() {
        purchaseButton.layer.cornerRadius = 30
        purchaseButton.isEnabled = false
        purchaseButton.backgroundColor = UIColor.init(red: 170/250, green: 170/250, blue: 170/250, alpha: 0.5)
    }
     
    // MARK: - Setup textField
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if !text.isEmpty {
            purchaseButton.isEnabled = true
            purchaseButton.backgroundColor = UIColor.init(red: 78/250, green: 208/250, blue: 92/250, alpha: 1)
        } else {
            purchaseButton.isEnabled = false
            purchaseButton.backgroundColor = UIColor.init(red: 170/250, green: 170/250, blue: 170/250, alpha: 0.5)
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    private func setupTextField() {
        nameTextField.delegate = self
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    @objc func hideKeyboard() {
        nameTextField.resignFirstResponder()
    }
    
    
    // MARK: - Actions
    
    @IBAction func chooseBaseSegmented(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print(sender.titleForSegment(at: 0)!)
        } else {
            print(sender.titleForSegment(at: 1)!)
        }
    }
    
    @IBAction func addCheeseSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 1,90€ dans le prix total
        if (sender.isOn){
            totalPrice = totalPrice + 1.90
            totalPrice = round(totalPrice * 100) / 100
            priceLabel.text = textPrice
            print(prix)
        } else {
            totalPrice -= 1.90
            priceLabel.text = textPrice
            print(prix)
        }
        priceLabel.text = textPrice
    }
    
    @IBAction func addChorizoSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 0,90€ dans le prix total
        if (sender.isOn){
            totalPrice = totalPrice + 0.90
            totalPrice = round(totalPrice * 100) / 100
            priceLabel.text = textPrice
        } else {
            totalPrice -= 0.90
            priceLabel.text = textPrice
        }
        priceLabel.text = textPrice
    }
    
    @IBAction func addSaladeSwitched(_ sender: UISwitch) {
        // Si le switch est activé, on augmente 2,10€ dans le prix total
        if (sender.isOn){
            totalPrice = totalPrice + 2.10
            totalPrice = round(totalPrice * 100) / 100
            priceLabel.text = textPrice
        } else {
            totalPrice -= 2.10
            priceLabel.text = textPrice
        }
        priceLabel.text = textPrice
    }
    
    @IBAction func numberOfPersonTapped(_ sender: UIStepper) {
        // Si + On augmente le nombre de personne, Si - on diminue le nombre de personnes
        let personne = (Int(sender.value))
        numbersOfPersonLabel.text = (Int(sender.value).description + " personnes")
        
        // Si le nombre de personne augmente, Le prix est multiplié par le nombre de personne
        if Int(sender.value) > oldValue {
            prix = totalPrice * Double(personne)
            priceLabel.text = textPrice
        } else {
            prix = totalPrice / Double(personne)
            priceLabel.text = textPrice
        }

        priceLabel.text = textPrice
        
        print(personne)
        print(prix)
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
                + "Base : \(chooseBase.selectedSegmentIndex == 0 ? chooseBase.titleForSegment(at: 0)! : chooseBase.titleForSegment(at: 1)!) \n"
                + "Fromage : \(addCheese.isOn ? "OUI" : "NON") \n"
                + "Chorizo : \(addChorizo.isOn ? "OUI" : "NON") \n"
                + "Salade : \(addSalade.isOn ? "OUI" : "NON") \n"
                + "Part(s) : \("\(numbersOfPersonLabel.text!)") \n"
                + "Temps de cuisson : \(timeCookingLabel.text ?? "0 min") \n\n"
                + "=> Prix total : \(priceLabel.text ?? "0.00€")")
    }
    
//    private func priceCalculate() {
//        if (addCheese.isOn) {
//            totalPrice = totalPrice + 1.90
//        }
//    }
    
}

#warning("Afficher une alerte si le bouton est inactive et que l'on clique dessus 'Veuillez renseigner votre nom avant de passer commande !'")
#warning("Si toutes les renseignements sont bon, passer à l'écran de prise en charge de commande")


