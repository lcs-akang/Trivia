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
    
    @State var currentTrivia: TriviaQuestion?
    
    @State var trueColour: Color = .black
    @State var falseColour: Color = .black
    
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                
                
                Spacer()
                
                
                if let currentTrivia = currentTrivia {
                    
                    Text(currentTrivia.question)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    
                    VStack {
                        
                        HStack(spacing: 25) {
                            Text("True")
                                .font(.title)
                                .foregroundColor(trueColour)
                            
                            Text("False")
                                .font(.title)
                                .foregroundColor(falseColour)

                        }
                        
                    }
                    .padding()
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)) {
                            answerOpacity = 1.0
                        }
                    }, label: {
                        Text("Give me the Answer")
                    })
                    .buttonStyle(.borderedProminent)
                    
                    Text(currentTrivia.correct_answer)
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
