//
//  TypeOfFasting.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 12.06.2021.
//

import Foundation

enum TypeOfFasting: Int {
    case hour24 = 86400
    case hour12 = 43200
    case hour8 = 28800
    case hour6 = 21600
    
    var definition: String {
        switch self {
        case .hour24:
            return "24 часовое голодание"
        case .hour12:
            return "12 часовое голодание"
        case .hour8:
            return "8 часовое голодание"
        case .hour6:
            return "6 часовое голодание"
        }
    }
}
