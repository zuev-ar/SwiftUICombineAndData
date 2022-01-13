//
//  FAQ.swift
//  SwiftUICombineAndData
//
//  Created by Arkasha Zuev on 08.01.2022.
//

import Foundation

struct FAQ: Identifiable, Decodable {
    var id: Int
    var question: String
    var answer: String
}
