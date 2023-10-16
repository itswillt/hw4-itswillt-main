//
//  StartMenuView.swift
//  Tic-Tac-Toe-Game-Settings
//
//  Created by Justin Wong on 10/4/23.
//

import SwiftUI

struct StartMenuView: View {
    var body: some View {
        VStack {
            Text("Tic-Tac-Toe")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                // Action for the "Play Game" button
            }) {
                Text("Play Game")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .homeViewButtonStyle(backgroundColor: .green) // Apply custom style
            
            Button(action: {
                // Action for the "Set Grid Color" button
            }) {
                Text("Set Grid Color")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
            }
            .homeViewButtonStyle(backgroundColor: .gray) // Apply custom style
        }
    }
}

//MARK: - HomeViewButtonStyle ViewModifier
struct HomeViewButtonStyle: ViewModifier {
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

//MARK: - Ignore below
extension View {
    func homeViewButtonStyle(backgroundColor: Color) -> some View {
        return modifier(HomeViewButtonStyle(backgroundColor: backgroundColor))
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}

