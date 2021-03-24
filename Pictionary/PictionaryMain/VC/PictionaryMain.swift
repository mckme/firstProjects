//
//  ImageView.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 26/02/21.
//  Copyright © 2021 none. All rights reserved.
//

import UIKit


class PictionaryMain: UIViewController {
    
    //MARK:- Instance Members
    var time: Int = Constants.Availabletime
    var animalList: [String] = []
    var animalListVM : AnimalListVM = AnimalListVM(filename: "AnimalData")
    var answers: [AnimalAnswer] = []
    var numberOfCurrentImages = Constants.numberOfImages
    private let timerView = TimerView(time: 10)
    var timeEnd = "Next"
    var myThemeColor = UIColor.init(red: 0.918, green: 0.201, blue: 0.439, alpha: 1)
    
    //MARK:- Properties
    @IBOutlet weak var TimerLbl: UILabel!
    @IBOutlet weak var AnimalImage: UIImageView!
    @IBOutlet weak var TextInput: UITextField!
    @IBOutlet weak var SubMit: UIButton!
    @IBOutlet weak var showResult: UIButton!
    @IBOutlet weak var TimeRemainLabel: UILabel!
    
    //MARK:- Methods
    
     static func controller() -> PictionaryMain {
         let vc =  InstanceConstant.kStoryboard.instantiateViewController(withIdentifier: "PictionaryMain") as! PictionaryMain
         return vc
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timerLoad()
        TimerLbl.text = "\(time)"
        handleTimer()
        UIFormatOptions()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(timerView)
        self.TimerLbl.superview?.bringSubviewToFront(TimerLbl)
        
       
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    private func UIFormatOptions() {
        AnimalImage.image = UIImage(named: animalListVM.getCurrentAnimal())
        AnimalImage.layer.borderWidth = 4
        AnimalImage.layer.borderColor = myThemeColor.cgColor
        TextInput.layer.borderColor = myThemeColor.cgColor
        TextInput.layer.borderWidth = 2
        TimeRemainLabel.text = "Time Remaining"
    }
    
    func timerLoad () {
        let y = CGFloat(100)
        let w = CGFloat(100)
        let x = (self.view.frame.width - w) / 2
        let h = w
        self.timerView.frame = CGRect(x: x, y: y, width: w, height: h)
        
        self.timerView.topAnchor.constraint(equalTo: TimeRemainLabel.bottomAnchor).isActive = true
        self.timerView.bottomAnchor.constraint(equalTo: AnimalImage.topAnchor).isActive = true
        self.TimerLbl.topAnchor.constraint(equalTo: TimeRemainLabel.bottomAnchor).isActive = true
        self.TimerLbl.bottomAnchor.constraint(equalTo: AnimalImage.topAnchor).isActive = true
        
        self.timerView.start()
    }
    
    private func handleTimer () {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in
            self.TimerLbl.text = "\(self.time)"
            self.time -= 1
            if (self.time < 0 && self.numberOfCurrentImages > 0) {
               //
                self.TimerLbl.text = "0"
                self.AnimalImage.image = UIImage(named: "TimeOver")
                self.SubMit.setTitle("Next", for: .normal)
                
            } else if (self.time < 0 && self.numberOfCurrentImages == 0) {
                self.handleSubmission()
            }
        }
        
    }
    
    @IBAction func handleSubmission() {
        numberOfCurrentImages -= 1
        answerSave(input: TextInput.text!)
        TextInput.text = ""
        self.SubMit.setTitle("Submit", for: .normal)
        
        if (numberOfCurrentImages != 0){
            animalListVM.nextAnimal(answers: answers)
            time = Constants.Availabletime
            AnimalImage.image = UIImage(named: animalListVM.getCurrentAnimal())
            self.timerView.start()
        } else {
            SubMit.isHidden = true
            showResult.isEnabled = true
            TimerLbl.isHidden = true
            TextInput.isHidden = true
            AnimalImage.image = UIImage(named: "gameover")
            timerView.stop()
            self.TimeRemainLabel.isHidden = true
        }
    }
     
    @IBAction func handleShowResult() {
        let vc = ResultView.controller(answers)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let simulationVC = segue.destination as? ResultView else {return}
        simulationVC.AniAnswers = answers
    }
    
    func answerSave (input: String) {
        let currentAnswer : AnimalAnswer = AnimalAnswer(shownAnimal: animalListVM.getCurrentAnimal(), Result: false)
        if input.caseInsensitiveCompare(currentAnswer.shownAnimal) == ComparisonResult.orderedSame {
            currentAnswer.Result = true
        }
        
        answers.append(currentAnswer)
        //currentResult.text = "\(currentAnswer.Result)"
    }
}

