//
//  ViewController.swift
//  BullsEye
//
//  Created by Maid Mehic on 26/03/2020.
//  Copyright © 2020 Maid Mehic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var targetValue: Int = 0
    var scoreValue: Int = 0
    var roundValue: Int = 0
    
    @IBOutlet weak var targetValueView: UILabel!
    @IBOutlet weak var scoreValueView: UILabel!
    @IBOutlet weak var roundValueView: UILabel!
    @IBOutlet weak var sliderView: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound(sliderVal: 0)
    }
    
    func startNewRound(sliderVal:Int) {
        calculateScore(sliderVal: sliderVal)
        roundValue+=1
        targetValue=Int.random(in: 1...100)
        targetValueView.text=String(targetValue)
        sliderView.value=50
        scoreValueView.text=String(scoreValue)
        roundValueView.text=String(roundValue)
    }
    
    func calculateScore(sliderVal:Int){
        if(sliderVal==0){//if new game, set score to 0
           scoreValue=sliderVal
        }
        else{
          scoreValue+=sliderVal
        }
    }
    
    @IBAction func startNewGame() {
        roundValue=0
        targetValue=0
        scoreValue=0
        startNewRound(sliderVal: 0)
    }

    @IBAction func showAlert(){
        let sliderValue = Int(sliderView.value.rounded())//get value of slider when click Hit Me! button
       
        let alert = UIAlertController(
            title: "Score",
            message:"Slider value is \(sliderValue) \n Target value is \(targetValue)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: {
            (UIAlertAction) in self.startNewRound(sliderVal: sliderValue)
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

