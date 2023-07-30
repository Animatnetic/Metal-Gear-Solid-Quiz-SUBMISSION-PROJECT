//
//  QuizSection.swift
//  Quiz App
//
//  Created by Faris Ansari on 14/07/2023.
//

import SwiftUI

struct QuizSection: View {
    @State private var questions = [
        QuestionStructure(questionPrompt: "Who is my newest sworn enemy?", answers: [
            AnswerStructure(answerPrompt: "Half Face", correct: false),
            AnswerStructure(answerPrompt: "Skull Face", correct: true),
            AnswerStructure(answerPrompt: "The Joker", correct: false),
            AnswerStructure(answerPrompt: "Lord Farquad", correct: false)
        ].shuffled()),
        
        QuestionStructure(questionPrompt: "How did I lose my arm?", answers: [
            AnswerStructure(answerPrompt: "Your wolf-dog bit it off", correct: false),
            AnswerStructure(answerPrompt: "A shotgun blew it off", correct: false),
            AnswerStructure(answerPrompt: "You lost it in a helicopter crash", correct: true),
            AnswerStructure(answerPrompt: "You just got bored", correct: false)
        ].shuffled()),
        
        QuestionStructure(questionPrompt: "What is my other name?", answers: [
            AnswerStructure(answerPrompt: "Big Daddy", correct: false),
            AnswerStructure(answerPrompt: "Big Uncle", correct: false),
            AnswerStructure(answerPrompt: "The Phantom Pain", correct: false),
            AnswerStructure(answerPrompt: "Big Boss", correct: true)
        ].shuffled()),
        
        QuestionStructure(questionPrompt: "What part of me has a bionic limb?", answers: [
            AnswerStructure(answerPrompt: "Right Arm", correct: true),
            AnswerStructure(answerPrompt: "Right Leg", correct: false),
            AnswerStructure(answerPrompt: "Left Arm", correct: false),
            AnswerStructure(answerPrompt: "Left Leg", correct: false)
        ].shuffled()),
        
        QuestionStructure(questionPrompt: "What martial art did I create?", answers: [
            AnswerStructure(answerPrompt: "CQC", correct: true),
            AnswerStructure(answerPrompt: "Karate", correct: false),
            AnswerStructure(answerPrompt: "Muay Thai", correct: false),
            AnswerStructure(answerPrompt: "Krav Maga", correct: false)
        ].shuffled()),
        
        QuestionStructure(questionPrompt: "What is the worst game under the series I am the protagonist of?", answers: [
            AnswerStructure(answerPrompt: "MGS: Survival", correct: true),
            AnswerStructure(answerPrompt: "MGS V: Phantom Pain", correct: false),
            AnswerStructure(answerPrompt: "MGS", correct: false),
            AnswerStructure(answerPrompt: "Call Of Duty", correct: false)
        ].shuffled())
    ].shuffled() // Randomizing even the questions
    
    @State private var timeRemaining = 10 // seconds.
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var questionIndex = 0
    @State private var health = [true, true, true]
    @State private var answeredWrong: Int = 0
    @State private var triggerFailiure = false
    
    func reduceHealth() {
        withAnimation {
            if answeredWrong == 1 {
                health = [true, true, false]
            } else if answeredWrong == 2 {
                health = [true, false, false]
            } else if answeredWrong == 3 {
                health = [false, false, false]
                triggerFailiure = true
            }
        }
    }
    
    
    func answerTriggered(_ answerIndex: Int) {
        let chosenAnswer = questions[questionIndex].answers[answerIndex]
        
        if chosenAnswer.correct {
            withAnimation {
                questionIndex += 1
                timeRemaining = 10
            }
        } else {
            answeredWrong += 1
            reduceHealth()
        }
    }
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea(.all)
            
            VStack {
                HStack() {
                    Spacer()
                    
                    ProgressView(value: Double(questionIndex), total: Double((questions.count)))
                        .tint(Color("Highlighted"))
                        .frame(width: 100)
                    
                    Image(systemName: (health[0] ? "heart.fill" : "heart"))
                        .foregroundColor(.red)
                    Image(systemName: (health[1] ? "heart.fill" : "heart"))
                        .foregroundColor(.red)
                    Image(systemName: (health[2] ? "heart.fill" : "heart"))
                        .foregroundColor(.red)
                    
                    Spacer()
                }
                .scaleEffect(2)
                .padding()
                
                Spacer()
                
                if questionIndex <= questions.count - 1 {
                    Text("\(timeRemaining)")
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.init(Color("Highlighted")))
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                answeredWrong += 1
                                questionIndex += 1
                                reduceHealth()
                                
                                timeRemaining = 10
                            }
                            
                        }
                    
                    Text("Q\(questionIndex + 1): \(questions[questionIndex].questionPrompt)")
                        .font(.title)
                        .foregroundColor(.init(Color("Tertiary")))
                        .padding()
                        .fontWeight(.black)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Button {
                                answerTriggered(0)
                            } label: {
                                Text("\(questions[questionIndex].answers[0].answerPrompt)")
                                    .padding(10)
                                    .foregroundColor(.init(Color("Primary")))
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 100)
                                    .background(Color("Tertiary"))
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                answerTriggered(1)
                            } label: {
                                Text("\(questions[questionIndex].answers[1].answerPrompt)")
                                    .padding(10)
                                    .foregroundColor(.init(Color("Primary")))
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 100)
                                    .background(Color("Tertiary"))
                                    .cornerRadius(10)
                            }
                        }
                        
                        HStack {
                            Button {
                                answerTriggered(2)
                            } label: {
                                Text("\(questions[questionIndex].answers[2].answerPrompt)")
                                    .padding(10)
                                    .foregroundColor(.init("Primary"))
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 100)
                                    .background(Color("Tertiary"))
                                    .cornerRadius(10)
                            }
                            
                            Button {
                                answerTriggered(3)
                            } label: {
                                Text("\(questions[questionIndex].answers[3].answerPrompt)")
                                    .padding(10)
                                    .foregroundColor(.init(Color("Primary")))
                                    .frame(maxWidth: .infinity)
                                    .frame(minHeight: 100)
                                    .background(Color("Tertiary"))
                                    .cornerRadius(10)
                                
                            }
                        }
                    }
                    .frame(minWidth: 250, maxWidth: 300)
                    .fixedSize(horizontal: true, vertical: false)
                    .scaleEffect(1.3)
                    
                    Spacer()
                } else {
                    IntermissionSection(retrievedScore: Double(Double(questions.count - answeredWrong) / Double(questions.count))
                    )
                }
            }
        }.fullScreenCover(isPresented: $triggerFailiure, onDismiss: {
            withAnimation {
                questionIndex = 0
                answeredWrong = 0
                health = [true, true, true]
                
                timeRemaining = 10
                
                questions.shuffle()
                
                for var question in questions {
                    question.answers = question.answers.shuffled()
                }
            }
            
            
        }, content: {
            FailiureSection()
        })
    }
}

struct QuizSection_Previews: PreviewProvider {
    static var previews: some View {
        QuizSection()
    }
}
