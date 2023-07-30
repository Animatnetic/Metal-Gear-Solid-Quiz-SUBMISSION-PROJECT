import Foundation
//

struct AnswerStructure {
    var answerPrompt: String
    var correct: Bool
}


struct QuestionStructure {
    var questionPrompt: String
    var answers: [AnswerStructure]
}

// Defining both the questions and answer as a structure so I can easily access them and can be scalable

var questions = [
    QuestionStructure(questionPrompt: "What is my name?", answers: [
        AnswerStructure(answerPrompt: "Faris", correct: true),
        AnswerStructure(answerPrompt: "Jeff", correct: false)
    ]),
    
    QuestionStructure(questionPrompt: "How old am I?", answers: [
        AnswerStructure(answerPrompt: "15", correct: true),
        AnswerStructure(answerPrompt: "14", correct: true)
    ])
].shuffled()


for var question in questions {
    question.answers.shuffle()
    
    for answer in question.answers {
        print(answer)
    }
}
