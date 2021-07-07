//
//  HomeViewController.swift
//  Pizza Nice
//
//  Created by fardi Clk on 06/07/2021.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButton()
    }
    
    private func setupButton() {
        startButton.layer.cornerRadius = 28
    }

}
