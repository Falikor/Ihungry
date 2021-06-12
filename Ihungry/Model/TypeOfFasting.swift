//
//  TypeOfFasting.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 12.06.2021.
//

import Foundation

enum TypeOfFasting: Character {
    case hour24 = "🐶"
    case hour12 = "🐱"
    case hour8 = "🐰"
    case hour6 = "🐢"
    
    var definition: String {
        switch self {
        case .hour24:
            return "Вам нравится быть с друзьями. Вы окружаете себя людьми, которые вам нравяться и всегда готовы помочь."
        case .hour12:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .hour8:
            return "Вам нравится все мягкое. Вы здоровы и полны энергии."
        case .hour6:
            return "Ваша сила - в мудрости. Медленный и вдумчивый выигрывает на больших дистанциях."
        }
    }
}
