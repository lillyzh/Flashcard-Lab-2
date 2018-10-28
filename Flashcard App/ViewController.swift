//
//  ViewController.swift
//  Flashcard App
//
//  Created by Lilly Zhou on 10/13/18.
//  Copyright © 2018 Lilly Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var buttonOption3: UIButton!
    @IBOutlet weak var buttonOption2: UIButton!
    @IBOutlet weak var buttonOption1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        card.layer.cornerRadius = 20.0
        frontLabel.layer.cornerRadius = 20.0
        backLabel.layer.cornerRadius = 20.0
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        frontLabel.clipsToBounds = true
        backLabel.clipsToBounds = true
        
        buttonOption1.layer.borderWidth = 3.0
        buttonOption1.layer.borderColor = #colorLiteral(red: 1, green: 0.2934636772, blue: 0.4067368507, alpha: 1)
        buttonOption1.layer.cornerRadius = 20.0
        
        buttonOption2.layer.borderWidth = 3.0
        buttonOption2.layer.borderColor = #colorLiteral(red: 1, green: 0.2934636772, blue: 0.4067368507, alpha: 1)
        buttonOption2.layer.cornerRadius = 20.0
        
        buttonOption3.layer.borderWidth = 3.0
        buttonOption3.layer.borderColor = #colorLiteral(red: 1, green: 0.2934636772, blue: 0.4067368507, alpha: 1)
        buttonOption3.layer.cornerRadius = 20.0
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as!
        CreationViewController
        creationController.flashcardsController = self
        
        if (segue.identifier == "EditSegue") {
        frontLabel.isHidden = false
        creationController.initialQuestion = frontLabel.text
        creationController.initialAnswer2 = backLabel.text
        creationController.initialAnswer1 = buttonOption1.currentTitle
        creationController.initialAnswer3 = buttonOption3.currentTitle
        }
    }
    
    @IBAction func didTapOnFlashCard(_ sender: Any) {
        if(frontLabel.isHidden == true){
            frontLabel.isHidden = false;
        }else{
            frontLabel.isHidden = true
        }
    }
    
    func updateFlashcard(question: String, answer1: String, answer2: String?, answer3: String?) {
        frontLabel.isHidden = false
        frontLabel.text = question
        backLabel.text = answer2
        
        buttonOption1.setTitle(answer1, for: .normal)
        buttonOption2.setTitle(answer2, for: .normal)
        buttonOption3.setTitle(answer3, for: .normal)
    }
    
    @IBAction func ButtonAction1(_ sender: Any) {
        frontLabel.isHidden = false
    }
    
    @IBAction func ButtonAction2(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func ButtonAction3(_ sender: Any) {
        frontLabel.isHidden = false
    }
}


