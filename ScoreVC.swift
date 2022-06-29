//
//  ScoreVC.swift
//  QuizApp
//
//  Created by Student on 4/26/22.
//

import UIKit

class ScoreVC: UIViewController {

    var scoreText = ""
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scoreLabel.text = scoreText
        self.imageLBL.image = UIImage(named: "con")
        
        let oldCenter = imageLBL.center
        let newCenter = CGPoint(x: oldCenter.x - 100, y: oldCenter.y)

        UIView.animate(withDuration: 1, delay: 0, options: .curveLinear, animations: {
            self.imageLBL.center = newCenter
        }) { (success: Bool) in
          print("Done moving image")
          }
    }
    

    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var imageLBL: UIImageView!
    
    
    
}
