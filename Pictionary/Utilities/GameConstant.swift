//
//  GameConstant.swift
//  Pictionary
//
//  Created by Piyush Bhatt on 06/03/21.
//  Copyright © 2021 none. All rights reserved.
//

import Foundation
import UIKit

enum Constants {
    static let numberOfImages: Int = 8
    static let Availabletime: Int = 10
}

 enum InstanceConstant{
    static let kBundle = Bundle.init(for: PictionaryMain.self)
    static let kStoryboard = UIStoryboard.init(name: "Main", bundle: kBundle)
}
