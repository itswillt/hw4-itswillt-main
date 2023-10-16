//
//  GameView.swift
//  Tic-Tac-Toe
//
//  Created by Justin Wong on 7/16/23.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: GameViewModel = GameViewModel()
    
    var body: some View {
        ScoreHeaderView(viewModel: viewModel)
        gameGrid
        FullGameResetButton(viewModel: viewModel)
    }
    
    private var gameGrid: some View {
        GeometryReader { geo in
            LazyVGrid(columns: viewModel.columns, spacing: 5) {
                ForEach(0..<9) { i in
                    ZStack {
                        GameSquareView(color: viewModel.gridColor, proxy: geo)
                        PlayerIndicatorView(systemImageName: viewModel.moves[i]?.indicator ?? "")
                    }
                    .onTapGesture {
                        viewModel.processPlayerMove(for: i)
                    }
                }
            }
            .verticallyCentered()
            .disabled(viewModel.isGameboardDisabled)
            .padding()
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                    viewModel.resetGame()
                }))
            })
        }
    }
}

//MARK: - GameSquareView
struct GameSquareView: View {
    var color: Color
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(color).opacity(0.5)
            .frame(width: abs(proxy.size.width / 3 - 15), height: abs(proxy.size.width / 3 - 15))
    }
}

//MARK: - PlayerIndicatorView
struct PlayerIndicatorView: View {
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

//MARK: - VerticallyCenteredView ViewModifer
struct VerticallyCenteredView: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            Spacer()
            content
            Spacer()
        }
    }
}

extension View {
    func verticallyCentered() -> some View {
        modifier(VerticallyCenteredView())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}
