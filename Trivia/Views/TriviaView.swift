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
    
    @State var trueColor: Color = .black
    @State var falseColor: Color = .black
    
    @State var answerShown: Bool = false
    
    
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
                                .foregroundColor(trueColor)
                            
                            Text("OR")
                                .font(.title3)
                            
                            Text("False")
                                .font(.title)
                                .foregroundColor(falseColor)

                        }
                        
                    }
                    .padding()
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 0.5)) {
                            
                            if case currentTrivia.correct_answer = "True" {
                                
                                trueColor = .green
                                falseColor = .red
                                
                            } else {
                                
                                trueColor = .red
                                falseColor = .green
                                
                            }
                            
                        }
                        
                        answerShown = true
                    
                    }, label: {
                        Text("Give me the Answer")
                    })
                    .disabled(answerShown == true ? true : false)
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
                                trueColor = .black
                                falseColor = .black
                    
                                answerShown = false
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
                                .disabled(answerShown == false ? true : false)
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
