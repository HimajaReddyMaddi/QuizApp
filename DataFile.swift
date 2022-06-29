//
//  DataFile.swift
//  QuizApp
//
//  Created by Student on 4/26/22.
//

import Foundation
struct Question{
    let text : String
    let answer : [Answer]
}

struct Answer{
    let text : String
    let correct : Bool
}
