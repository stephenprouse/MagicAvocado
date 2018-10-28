//
//  ViewController.swift
//  Magic Avocado
//
//  Created by Stephen Prouse on 11/8/17.
//  Copyright © 2017 Stephen Prouse. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var labelMessage: UILabel!

    @IBAction func clearButton(_ sender: Any) {
        labelMessage.text = ""
        explosion.stopAnimating()
        
    }
    
    @IBOutlet weak var explosion: UIImageView!
    
    var buttonBeep: AVAudioPlayer?
    func playSound() {
        let path = Bundle.main.path(forResource: "blart", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            buttonBeep = try AVAudioPlayer(contentsOf: url)
            buttonBeep?.play()
            print("playing " + path)
        } catch {
            print(error)
        }
    }
    
    var sound: Bool = true
    var vibrate: Bool = true
    var messages: [String] =
        ["Yes",
         "No",
         "Doubtful",
         "Maybe",
         "Yeah right",
         "Don't be rediculous",
         "Seriously? No",
         "Not a chance",
         "Count on it",
         "Someday probably",
         "Absolutely",
         "Without a doubt",
         "Ask me again",
         "I can't say",
         "Sure why not"]
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
        let randomNumber = arc4random_uniform(15)
        print(randomNumber)
        labelMessage.text = messages[(Int(randomNumber))]
        
        // Send vibrate
        AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        print("Device vibrated!")
        
        // Play sound
        playSound()
        print("Sound played!")
        
        // Display animation
        explosion.animationImages =
            [UIImage(named: "explosion1.png")!,
             UIImage(named: "explosion2.png")!,
             UIImage(named: "explosion3.png")!,
             UIImage(named: "explosion4.png")!,
             UIImage(named: "explosion5.png")!,
             UIImage(named: "explosion6.png")!
        ]
        explosion.animationDuration = 0.4
        explosion.startAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

