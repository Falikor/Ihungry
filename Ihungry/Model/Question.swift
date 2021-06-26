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
                text: "Как вы относитесь к пище?",
                type: .single,
                answers: [
                    Answer(text: "Еда это топливо и не более.", type: .hour24),
                    Answer(text: "Могу пропустить пару приемов пищи.", type: .hour12),
                    Answer(text: "Не делаю культ из еды.", type: .hour8),
                    Answer(text: "Это главное в моей жизни!", type: .hour6)
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
                text: "Как много воды Вы потребляете в день?",
                type: .ranged,
                answers: [
                    Answer(text: "Мало", type: .hour6),
                    Answer(text: "Недостаточно", type: .hour8),
                    Answer(text: "Нормальная", type: .hour12),
                    Answer(text: "Много", type: .hour24)
                ]
            ),
            Question(
                text: "Какой прием пищи является самым важным для вас?",
                type: .multiple,
                answers: [
                    Answer(text: "Ужин", type: .hour6),
                    Answer(text: "Обед", type: .hour8),
                    Answer(text: "Завтрак", type: .hour12),
                    Answer(text: "Не вижу разницы", type: .hour24)
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
