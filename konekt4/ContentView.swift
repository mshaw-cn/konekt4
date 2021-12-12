//
//  ContentView.swift
//  konekt4
//
//  Created by Michael Shaw on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var winner = false
    private let numberOfPlayers = 2

    @ObservedObject private var grid = Grid()
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        VStack {
            
            Text(winner ? "Winner Found" : "Winner Not Found")
                .font(.title)
            
            LazyVGrid(columns: columns) {
                ForEach((0...(grid.n*grid.n - 1)), id: \.self) { i in
                    // convert 0-64 to 2d indices
                    let row = i / grid.n
                    let col = i % grid.n
                    let elementValue = grid.grid[row][col]
                    
                    
                    Button(action: {
                        // cycle through {0, 1, ..., numberOfPlayers}
                        grid.grid[row][col] = (grid.grid[row][col] + 1) % (numberOfPlayers + 1)
                    }) {
                        Text("\(elementValue)")
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke())
                    }
                }
            }
            .padding()
            
            Button("Check for Winner") {
                winner = grid.checkGridForWinner()
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 10.0).stroke())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portrait)
    }
}
