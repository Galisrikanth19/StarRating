//
//  StarRatingView.swift
//  Created by GaliSrikanth on 30/05/24.

import UIKit

class StarRatingView: UIView {
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var ratingsContainer: UIStackView!
    var selectedRating = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    private func commonInit() {
        let nib = UINib(nibName: "StarRatingView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    
    @IBAction func starBtnClicked(_ sender: UIButton) {
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
