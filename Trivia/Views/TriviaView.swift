//
//  TriviaView.swift
//  Trivia
//
//  Created by Aidan Kang on 2023-04-20.
//

import SwiftUI

struct TriviaView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Which nation hosted the FIFA World Cup in 2006?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    
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
