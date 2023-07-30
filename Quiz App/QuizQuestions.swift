//
//  QuizQuestions.swift
//  Quiz App
//
//  Created by Faris Ansari on 14/07/2023.
//

import Foundation
//

enum correctOptionIdentifier {
    case one, two, three, four
}


struct QuestionStructure {
    var questionPrompt: String
    
    var option1: String
    var option2: String
    var option3: String
    var option4: String
    
    var correctOption: correctOptionIdentifier
}

// Defining both the questions and answer as a structure so I can easily access them and can be scalable
