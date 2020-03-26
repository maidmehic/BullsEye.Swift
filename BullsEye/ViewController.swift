//
//  ViewController.swift
//  BullsEye
//
//  Created by Maid Mehic on 26/03/2020.
//  Copyright © 2020 Maid Mehic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert(){
        let alert = UIAlertController(
            title: "Hello world",
            message: "This is AlertController",
            preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "Great", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func onActionRespond(){
        print("CLICKED")
    }
}

