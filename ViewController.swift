//  ViewController.swift
//  GREMe

import UIKit

class ViewController: UIViewController {

    // MARK: outlets
    @IBOutlet weak var card: UIButton!
    @IBOutlet weak var knowDeck: UIButton!
    @IBOutlet weak var dontKnowDeck: UIButton!
    
    @IBOutlet weak var iKnowButton: UIButton!
    @IBOutlet weak var iDontKnowButton: UIButton!
    @IBOutlet weak var dataLabel: UILabel!
    
    // MARK: vars
    var masterBack = ["b1", "b2", "b3", "b4", "b5", "b6", "b7", "b8", "b9", "b10", "b11", "b12", "b13", "b14", "b15"]
    var masterFront = ["f1","f2","f3","f4","f5", "f6","f7","f8","f9","f10", "f11", "f12", "f13", "f14", "f15"]
    
    var rightBack = [String]()
    var rightFront = [String]()
    
    var wrongBack = [String]()
    var wrongFront = [String]()
    
    var i: Int = 0
    var isFront = false
    
    // MARK: functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Hide buttons on load
        knowDeck.layer.opacity = 0
        dontKnowDeck.layer.opacity = 0
        
        // Round buttons
        dontKnowDeck.layer.cornerRadius = 10
        knowDeck.layer.cornerRadius = 10
        iKnowButton.layer.cornerRadius = 10
        iDontKnowButton.layer.cornerRadius = 10
        
        // Set data label
        dataLabel.text = "\(i)  /  \(masterBack.count)"
    }
    
    @IBAction func flipCard() {
        dataLabel.text = "\(i + 1)  /  \(masterBack.count)"
        if isFront {
            isFront = false
            let image = UIImage(named: masterBack[i])
            card.setImage(image, for: .normal)
            UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else {
            isFront = true
            let image = UIImage(named: masterFront[i])
            card.setImage(image, for: .normal)
            UIView.transition(with: card, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
    }
    
    @IBAction func iKnow() {
        // Add current card to right array
        if rightBack.contains(masterBack[i]) {}
        else { rightBack.append(masterBack[i]) }
        
        if rightFront.contains(masterFront[i]) {}
        else { rightFront.append(masterFront[i]) }
        
        // Increment i
        // Off by 1 error, count = 4
        if (i < ( masterBack.count - 1 )) { i += 1 }
        else { displayData() }
        
        flipCard()
    }
    
    @IBAction func iDontKnow() {
        // Add current card to right array
        if wrongBack.contains(masterBack[i]) {}
        else { wrongBack.append(masterBack[i]) }
        
        if wrongFront.contains(masterFront[i]) {}
        else { wrongFront.append(masterFront[i]) }
        
        // Increment i
        // Off by 1 error, count = 4
        if (i < ( masterBack.count - 1 )) { i += 1 }
        else { displayData() }
    
        flipCard()
    }
    
    // When card == nil
    func displayData() {
        // Hide card and buttons
        card.layer.opacity = 0
        iKnowButton.layer.opacity = 0
        iDontKnowButton.layer.opacity = 0
        // Show data buttons
        knowDeck.layer.opacity = 1
        dontKnowDeck.layer.opacity = 1
        
        print("Right Deck = \(rightFront) \(rightBack)")
        print("Wrong Deck = \(wrongFront) \(wrongBack)")
        return
    }
    
    @IBAction func resetKnowDeck() {
        // Check if deck contains cards
        if ( rightBack.count == 0 || rightFront.count == 0 ) {
            print("There are no cards in your deck")
            return
        }
        // Show deck
        card.layer.opacity = 1
        iKnowButton.layer.opacity = 1
        iDontKnowButton.layer.opacity = 1
        // Hide data buttons
        knowDeck.layer.opacity = 0
        dontKnowDeck.layer.opacity = 0
        // Reset index
        i = 0
        
        // Remove all elements
        masterBack.removeAll()
        masterFront.removeAll()
        // Add the right deck to master
        masterBack = masterBack + rightBack
        masterFront = masterFront + rightFront
        print("New master deck = \(masterFront), \(masterBack)")
        rightBack.removeAll()
        rightFront.removeAll()
        flipCard()
    }
    
    
    @IBAction func resetDontKnowDeck() {
        // Check if deck contains cards
        if ( wrongBack.count == 0 || wrongFront.count == 0 ) {
            print("There are no cards in your deck")
            return
        }
        // Show deck
        card.layer.opacity = 1
        iKnowButton.layer.opacity = 1
        iDontKnowButton.layer.opacity = 1
        // Hide data buttons
        knowDeck.layer.opacity = 0
        dontKnowDeck.layer.opacity = 0
        // Reset index
        i = 0
        
        // Remove all elements
        masterBack.removeAll()
        masterFront.removeAll()
        // Add the right deck to master
        masterBack = masterBack + wrongBack
        masterFront = masterFront + wrongFront
        print("New master deck = \(masterFront), \(masterBack)")
        wrongBack.removeAll()
        wrongFront.removeAll()
        flipCard()
    }
}

