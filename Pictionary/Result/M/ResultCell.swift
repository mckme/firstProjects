//
//  ResultCell.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 02/03/21.
//  Copyright © 2021 none. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalResult: UILabel!
    var AnimalResults : AnimalAnswer = AnimalAnswer(shownAnimal: "", Result: true)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateCell () {
        animalName.text = AnimalResults.shownAnimal
        animalResult.text = AnimalResults.Result ? "Correct" : "Incorrect"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool){
        super.setSelected(selected, animated: animated)
    }

}
