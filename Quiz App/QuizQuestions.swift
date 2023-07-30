//
//  QuizQuestions.swift
//  Quiz App
//
//  Created by Faris Ansari on 14/07/2023.
//

import Foundation
//

struct AnswerStructure: Hashable {
    var answerPrompt: String
    var correct: Bool
}


struct QuestionStructure {
    var questionPrompt: String
    var answers: [AnswerStructure]
}

// Defining both the questions and answer as a structure so I can easily access them and can be scalable
