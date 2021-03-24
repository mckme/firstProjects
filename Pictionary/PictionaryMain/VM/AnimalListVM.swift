//
//  PictionaryVM.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 06/03/21.
//  Copyright © 2021 none. All rights reserved.
//

import Foundation

class AnimalListVM {
    
    var animalList : [String] = []
    var currentIndex = 0
    
    init(filename: String) {
        readJsonFile(filename: filename)
        nextAnimal(answers: nil)
    }
    
    func readJsonFile(filename : String) {
             if let path = Bundle.main.path(forResource: filename , ofType: "json") {
                 do {
                     let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                     let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                     if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let data = jsonResult["data"] as? [String] {
                         animalList = data
                     }
                 } catch {}
             }
         }
    
    func nextAnimal(answers : [AnimalAnswer]?) {
        currentIndex = Int.random(in: 0..<animalList.count-1)
        if answers == nil {
            return
        }
        var isAnimalInAnswers : Bool = true
        while  (isAnimalInAnswers == true ) {
            isAnimalInAnswers = false
            
            for thisAnswer in answers! {
                if (thisAnswer.shownAnimal == animalList[currentIndex])
                {
                    isAnimalInAnswers = true
                    currentIndex = Int.random(in: 0..<animalList.count-1)
                    break
                }
            }
        }
    }
    
    func getCurrentAnimal() -> String{
        return animalList[currentIndex]
    }
    
    func getAnimalImage() -> String{
        return animalList[currentIndex]
    }
}
