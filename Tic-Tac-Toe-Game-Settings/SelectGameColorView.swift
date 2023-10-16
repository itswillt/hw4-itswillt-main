//
//  SelectGameColorView.swift
//  Tic-Tac-Toe-Game-Settings
//
//  Created by Justin Wong on 10/4/23.
//

import SwiftUI

struct SelectGameColorView: View {
    @State private var selectedColor: Color = .red // Default selected color
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Selected Grid Color")
                    .font(.title)
                    .padding()
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 50, height: 50)
                    .foregroundColor(selectedColor)
                    .opacity(0.3)
                    .padding()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 10) {
                    ForEach(Color.allColors, id: \.self) { color in
                        ColorCircleView(color: color, selectedColor: $selectedColor)
                            .onTapGesture {
                                selectedColor = color
                            }
                    }
                }
                .padding()
            }
            .navigationBarItems(
                leading: Button(action: {
                    // Dismiss the sheet or perform your desired action
                }) {
                    Image(systemName: "xmark")
                },
                trailing: Text("Set Grid Color")
            )
            .navigationBarTitle("Set Grid Color", displayMode: .inline)
        }
    }
}

// View to represent an individual selectable color circle
struct ColorCircleView: View {
    var color: Color
    @Binding var selectedColor: Color

    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(color)
                .frame(width: 50, height: 50)
                .opacity(selectedColor == color ? 1.0 : 0.7)

            if selectedColor == color {
                Circle()
                    .stroke(Color.indigo.opacity(0.3), lineWidth: 5)
                    .frame(width: 55, height: 55)
            }
        }
    }
}

extension Color {
    static let allColors: [Color] = [.red, .green, .blue, .purple, .yellow, .black, .brown, .cyan, .indigo]
}

struct SelectGameColorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectGameColorView()
    }
}

