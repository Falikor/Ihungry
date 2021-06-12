//
//  Question.swift
//  Ihungry
//
//  Created by Татьяна Татьяна on 12.06.2021.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    
    static func getQuestions() -> [Question] {
        return [
            Question(
                text: "Есть ли у Вас опыт в периодическом голодании?",
                type: .single,
                answers: [
                    Answer(text: "Большой опыт", type: .hour24),
                    Answer(text: "Практикую периодический", type: .hour12),
                    Answer(text: "Незначительный", type: .hour8),
                    Answer(text: "Нет опыта", type: .hour6)
                ]
            ),
            Question(
                text: "Есть ли у Вас хронические заболевания?",
                type: .multiple,
                answers: [
                    Answer(text: "Заболивание ЖКТ", type: .hour6),
                    Answer(text: "Диабе́т", type: .hour8),
                    Answer(text: "Гормональные заболевания", type: .hour12),
                    Answer(text: "Нет заболеваний", type: .hour24)
                ]
            ),
            Question(
                text: "На сколько активную жизнь Вы видете?",
                type: .ranged,
                answers: [
                    Answer(text: "Пасивная", type: .hour6),
                    Answer(text: "Недостаточно", type: .hour8),
                    Answer(text: "Нормальная", type: .hour12),
                    Answer(text: "Активная", type: .hour24)
                ]
            ),
        ]
    }
}
