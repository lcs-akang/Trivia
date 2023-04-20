//
//  TriviaView.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import SwiftUI

struct TriviaView: View {
    
    // MARK: Stored properties
    
    @State var answerOpacity = 0.0
    
    @State var currentTrivia = exampleTrivia
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                Text(currentTrivia.question)
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    withAnimation(.easeIn(duration: 1.0)) {
                        answerOpacity = 1.0
                    }
                }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .tint(.black)
                })
                
                Text(currentTrivia.answer)
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .opacity(answerOpacity)
                
            }
            .navigationTitle("Trivia")
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
