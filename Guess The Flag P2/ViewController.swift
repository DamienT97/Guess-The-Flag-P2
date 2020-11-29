//
//  ViewController.swift
//  Guess The Flag P2
//
//  Created by Damien Townley on 29/11/2020.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        correctAnswer = Int.random(in: 0...2)
        title = "\(countries[correctAnswer].uppercased()) Score: \(score)"
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            message = "Correct!"
            
        } else {
            title = "Wrong"
            score -= 1
            message = "Wrong! You selected \(countries[sender.tag])."
        }
        if questionsAsked < 10 {
        let ac = UIAlertController(title: title, message: "\(message) Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: title, style: .default, handler: askQuestion))
        present(ac,animated: true)
        questionsAsked += 1
        
        } else {
            let ac = UIAlertController(title: "Game Over!", message: "Your final score is \(score)", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestion))
            present(ac, animated: true)
            restartGame()
        }
    }
    
    func restartGame() {
        questionsAsked = 0
        score = 0
    }
    
}

