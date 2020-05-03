//
//  ViewController.swift
//  MadLibsApp
//
//  Created by אדיר נוימן on 02/05/2020.
//  Copyright © 2020 Adir Noyman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var verbTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var animalSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberSlider: UISlider!
    @IBOutlet weak var numberOfPetsStepper: UIStepper!
    @IBOutlet weak var happyEndingSwitch: UISwitch!
    
    @IBOutlet weak var containerView: UIView!
    
   
    @IBAction func lessOrMoreValueDidChanged(_ sender: UISegmentedControl) {
        // If user tapps on less - hide the containerView
        if sender.selectedSegmentIndex == 0 {
            
            containerView.isHidden = true
            
        } else if sender.selectedSegmentIndex == 1 {
          // If user tapps on more - show the containerView
            containerView.isHidden = false
            
        }
        
    }
    
    
    @IBAction func sliderDidChanged(_ sender: UISlider) {
        
        // Update the label on the left of the slider
        
        numberLabel.text = "\(Int(sender.value))"
        
        
    }
    
    
    @IBAction func stepperDidChanged(_ sender: UIStepper) {
        
        // Update the label on the left of the stepper based on the stepper value
        
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func createStoryDidTapped(_ sender: UIButton) {
        
        /* At the age of \(age), \(first name) \(verb) a trip to \(location) with
        \(num pets) pets in order to sing with a \(animal). \(first name) decided to buy \(slider number). Now they live \(happy ending?) */
        let animal = animalSegmentedControl.titleForSegment(at: animalSegmentedControl.selectedSegmentIndex)!
        let happyEnding = happyEndingSwitch.isOn ? "Now they live happily ever after" : "Things didn't turn out to well..."
        
        let story = "At the age of \(ageTextField.text!), \(firstNameTextField.text!) took a trip to \(locationTextField.text!) with \(numberOfPetsLabel.text!) pets in order to sing with a \(animal). \(firstNameTextField.text!) decided to buy \(Int(numberSlider.value)). \(happyEnding)."
        
        print(story)
        
        let alertController = UIAlertController(title: "My Story", message: story, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default , handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}

