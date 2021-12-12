//
//  ContentView.swift
//  konekt4
//
//  Created by Michael Shaw on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var winner = false
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
                ForEach((0...63), id: \.self) { i in
                    // convert 0-64 to 2d indices
                    let row = i / grid.cols
                    let col = i % grid.rows
                    let elementValue = grid.grid[row][col]
                    
                    
                    Button(action: {
                        grid.grid[row][col] = (grid.grid[row][col] + 1) % 3
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
