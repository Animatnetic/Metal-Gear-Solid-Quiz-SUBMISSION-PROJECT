//
//  ContentView.swift
//  Quiz App
//
//  Created by Faris Ansari on 14/07/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var triggeringOpacity = 0.1
    @State private var promptText = false
    @State private var blurRate = 0.0
    @State private var showQuizSection = false
    @State private var allowClick = false
    
    var body: some View {
        ZStack {
            Color("Primary")
            
            VStack {
                Spacer()
        
                Image("SnakePFP")
                    .resizable()
                    .scaledToFit()
                    .opacity(triggeringOpacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 3)) {
                            triggeringOpacity = 1
                            
                            withAnimation(.easeIn(duration: 6)) {
                                promptText = true
                                blurRate = 10.0
                            }
                        }
                        
                        allowClick = true
                    }
                    .blur(radius: blurRate)
            }
            
            VStack {
                Spacer()
                
                Text("**Theme: Metal Gear Solid**\n \nGreetings maggot!\nIt is I, **Solid Snake!**\n\nSo, you want to become a diamond dog?\n \nComplete this quiz with less than 3 mistakes and you will aid this country in the next battle!\n \nBeware **you will be timed**!")
                    .foregroundColor(.white)
                    .opacity(promptText ? 1 : 0)
                
                Spacer()
                
                Button {
                    if allowClick {
                        showQuizSection = true
                    }
                } label: {
                    Text("Continue")
                        .padding()
                        .background(Color("Highlighted"))
                        .fontWeight(.heavy)
                        .cornerRadius(15)
                        .opacity(promptText ? 1 : 0)
                }
            }.padding()
        }
        .ignoresSafeArea()
        .fullScreenCover(isPresented: $showQuizSection) {
            QuizSection()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
