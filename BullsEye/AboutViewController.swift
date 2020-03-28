//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Maid Mehic on 28/03/2020.
//  Copyright © 2020 Maid Mehic. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text="*** Bull's Eye *** \n \n" +
        "Welcome to the awesome game of Bull's Eye where you can win points and fame by dragging a slider.\n \n" +
        "Your goal is to place the slider as close as possible to the target value. The closer you are, the more oints you score. Enjoy!"
    }
    
    @IBAction func close(){
        dismiss(animated: true, completion: nil)
    }
}
