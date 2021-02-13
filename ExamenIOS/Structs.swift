//
//  Structs.swift
//  ExamenIOS
//
//  Created by Guillermo Saavedra Dorantes on 12/02/21.
//

import Foundation


struct JSON: Codable {
    let colors: [String]
    let questions: [Question]
}

struct ChartData: Codable {
    let percetnage: Int
    let text: String
}

struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartData]
}
