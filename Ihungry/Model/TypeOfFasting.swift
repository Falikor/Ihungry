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
        
        var description: String {
            switch self {
            case .hour24:
                return "24/0 — радикальный способ, подразумевающий полное суточное голодание. Использовать данный вид голодания нужно осторожно, не чаще одного раза в неделю."
            case .hour12:
                return "12/12 — система подразумевает 12 часов чувства голода и 12 часов для употребления пищи. Оптимально подходит для людей без противопоказаний"
            case .hour8:
                return "Системы питания «16 на 8», которая предусматривает интервальное голодание: 8 часов отводятся для пищи, 16 для голода. Методика может использоваться как женщинами, так и мужчинами.\n Общие принципы диеты 16/8 следующие:\n 1) Питаться необходимо дробно, не менее 3 раз за восьмичасовой промежуток времени. \n 2) Тренировки должны проводиться на голодный желудок. До них необходимо употребить лишь 10 г аминокислот, разведенных в воде. Их можно приобрести в магазине спортивного питания. \n 3) Завтрак должен состоять из сложных углеводов. В остальные приемы пищи акцент следует делать на белок."
            case .hour6:
                return "6/18 самый щадящий способ голодания. Подходит для людей с хроническими заболеваниями."
            }
    }
}
