//
//  ViewController.swift
//  BullsEye
//
//  Created by Maid Mehic on 26/03/2020.
//  Copyright © 2020 Maid Mehic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var target: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    @IBOutlet weak var targetValueView: UILabel!
    @IBOutlet weak var scoreValueView: UILabel!
    @IBOutlet weak var roundValueView: UILabel!
    @IBOutlet weak var sliderView: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleSlider()
        startNewRound()
    }
    
    func startNewRound() {
        round+=1
        target=Int.random(in: 1...100)
        targetValueView.text=String(target)
        sliderView.value=50
        scoreValueView.text=String(score)
        roundValueView.text=String(round)
    }
    
    @IBAction func startNewGame() {
        round=0
        target=0
        score=0
        startNewRound()
    }
    
    @IBAction func showAlert(){
        let sliderValue = Int(sliderView.value.rounded())//get value of slider when click Hit Me! button
        
        let difference = abs(target-sliderValue)
        var points = 100 - difference
        points = giveExtraPoints(points: points)
        
        score+=points
        
        let alertTitle = generateAlertTitle(difference: difference)
        
        let alert = UIAlertController(title:alertTitle, message:"You scored \(points) points!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Okay", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func generateAlertTitle(difference: Int) -> String{
        switch difference {
        case 0:
            return "Perfect!"
        case 1...10:
            return "You almost had it!"
        case 11...20:
            return "Pretty good!"
        default:
            return "Not even close!"
        }
    }
    
    func giveExtraPoints(points : Int) -> Int{
        if(points==100){
            return points + 100
        }
        else if(points > 90){
            return points + 50
        }else{
            return points
        }
    }
    
    func styleSlider(){
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        sliderView.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        sliderView.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        sliderView.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        sliderView.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
}
