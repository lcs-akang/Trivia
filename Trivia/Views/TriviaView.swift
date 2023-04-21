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
    
    @State var currentTrivia: Trivia?
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                
                if let currentTrivia = exampleTrivia {
                    
                    Text(exampleTrivia.question)
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
                    
                    Text(exampleTrivia.correct_answer)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(answerOpacity)
                    
                } else {
                    ProgressView()
                }
                
                
                Spacer()
                
                
                Button(action: {
                                     // Reset the interface
                                     answerOpacity = 0.0

                                     Task {
                                         // Get another joke
                                         withAnimation {
                                             currentTrivia = nil
                                         }
                                         currentTrivia = await NetworkService.fetch()
                                     }
                                 }, label: {
                                     Text("Fetch another one")
                                 })
                                 .disabled(answerOpacity == 0.0 ? true : false)
                                 .buttonStyle(.borderedProminent)
                
            }
            .navigationTitle("Trivia")
        }
        .task {
            currentTrivia  = await NetworkService.fetch()
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
