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
    
    // MARK: Computed properties
    var body: some View {
        NavigationView {
            VStack {
                Text("Which nation hosted the FIFA World Cup in 2006?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    answerOpacity = 1.0
                }, label: {
                    Image(systemName: "arrow.down.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .tint(.black)
                })
                
                Text("Germany")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .opacity(answerOpacity)
                
            }
            .navigationTitle("Sports Trivia")
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
    }
}
