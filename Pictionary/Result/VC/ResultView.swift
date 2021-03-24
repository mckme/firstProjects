//
//  ResultView.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 02/03/21.
//  Copyright © 2021 none. All rights reserved.


import UIKit

class ResultView: UIViewController, UITableViewDataSource {
    
    var AniAnswers : [AnimalAnswer] = []
    
    @IBOutlet weak var ResultViewTable: UITableView!
    @IBOutlet weak var finalScore: UILabel!
    
    override func viewDidLoad() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        finalScore.text = "\(calculateScore())"
        ResultViewTable.dataSource = self
    }
    
    static func controller(_ data: [AnimalAnswer]) -> ResultView {
        let vc = InstanceConstant.kStoryboard.instantiateViewController(withIdentifier: "ResultView") as! ResultView
        vc.AniAnswers = data
        return vc
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AniAnswers.count
    }
    
    func calculateScore () -> Int{
        var totalScore : Int = 0
        for AniAnswer in AniAnswers {
            if ( AniAnswer.Result){
            totalScore += 1
            }
        }
        return totalScore
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCellReuse" , for: indexPath) as! ResultCell
        cell.AnimalResults = AniAnswers[indexPath.row]
        cell.updateCell()
        
    return cell
    }
}
