//
//  Singleton.swift
//  DEVAPPS-2019-2-Authentication
//
//  Created by Rafael Lucena on 7/30/20.
//  Copyright © 2020 Rafael Lucena. All rights reserved.
//

import Foundation

class Singleton {

    static let shared = Singleton()
    private init() {}

    var username: String = ""
    var password: String = ""
}
