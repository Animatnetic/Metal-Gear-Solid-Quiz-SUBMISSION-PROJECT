//
//  IntermissionSection.swift
//  Quiz App
//
//  Created by Faris Ansari on 16/07/2023.
//

import SwiftUI

struct IntermissionSection: View {
    var retrievedScore: Double
    
    var body: some View {
        VStack(alignment: .center) {
            
            Image(systemName: "trophy.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.init(Color("Tertiary")))
                .frame(width: 100, height: 200)
            
            Text("Attention Maggot!\nYou passed!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.init(Color("Tertiary")))
                .multilineTextAlignment(.center)
            
            Spacer()
            
            Text("Here is a quick summary of your performance:")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.init(Color("Secondary")))
            
            Spacer()
            
            ZStack {
                Circle()
                    .stroke(
                        Color("Highlighted")
                            .opacity(0.4),
                        lineWidth: 30.0
                    )
                
                Text("\(Int(retrievedScore * 100)) %")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.init(Color("Secondary")))
                
                Circle()
                    .trim(from: 0, to: retrievedScore)

                    .stroke(
                        Color("Secondary"),
                        style: StrokeStyle(
                            lineWidth: 30.0,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(Angle(degrees: -90))
                
            }
            .frame(width: 350, height: 400)
        }
    }
}

struct IntermissionSection_Previews: PreviewProvider {
    static var previews: some View {
        IntermissionSection(retrievedScore: 5/6)
    }
}
