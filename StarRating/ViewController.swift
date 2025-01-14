//
//  ViewController.swift
//  StarRating
//
//  Created by GaliSrikanth on 29/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ratingsContainer: UIStackView!
    var selectedRating = 0
    
    
    @IBOutlet weak var starRatingView: StarRatingView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAction(_ sender: Any) {
        print(starRatingView.selectedRating)
    }
    
    @IBAction func selectedRating(_ sender: UIButton) {
        if selectedRating == sender.tag {
            selectedRating = 0
        } else {
            selectedRating = sender.tag
        }
        
        updateRating()
    }
    
    private func updateRating() {
        let selImg = UIImage(named: "GoldStar")
        let normalImg = UIImage(named: "GoldStarEmpty")
        
        for subview in ratingsContainer.subviews {
            if let btn = subview as? UIButton {
                if btn.tag <= selectedRating {
                    btn.setImage(selImg, for: .normal)
                    //btn.tintColor = UIColor.blue
                } else {
                    btn.setImage(normalImg, for: .normal)
                    //btn.tintColor = UIColor.gray
                }
            }
        }
    }
}

