//
//  FailiureSection.swift
//  Quiz App
//
//  Created by Faris Ansari on 16/07/2023.
//

import SwiftUI

struct FailiureSection: View {
    @Environment(\.dismiss) private var dissmissRetry
    
    var body: some View {
        ZStack {
            Color("Primary")
                .ignoresSafeArea(.all)
            
            VStack(alignment: .center) {
                
                Image(systemName: "exclamationmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.init(Color("Tertiary")))
                    .frame(width: 100, height: 200)
                
                Text("Attention Maggot!\nYou Failed!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.init(Color("Tertiary")))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Text("Do it again, and this time do not fail me!")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.init(Color("Secondary")))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button {
                    dissmissRetry()
                } label: {
                    Text("Retry")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(30)
                        .background(Color("Highlighted"))
                        .cornerRadius(15)
                        .foregroundColor(.init(Color("Secondary")))
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
        }
    }
}

struct FailiureSection_Previews: PreviewProvider {
    static var previews: some View {
        FailiureSection()
    }
}
