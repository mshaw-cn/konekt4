//
//  grid.swift
//  konekt4
//
//  Created by Michael Shaw on 12/8/21.
//

import Foundation

class Grid: ObservableObject {
    // initialized with 'empty squares'
    @Published var grid: [[Int]] = [[0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0],
                         [0, 0, 0, 0, 0, 0, 0, 0]]
    
    var rows: Int {
        grid.count
    }
    
    var cols: Int {
        grid[0].count
    }
    
    /// This function checks a given 2D Int Array if there are n consecutive values of the same number for each element
    ///
    /// ```
    /// checkGridForWinner() // True
    /// ```
    /// - Parameter grid: an m x n representation of a grid
    /// - Returns: A bool representing if a winner was found (4 of the same element in a row) in the `grid`.
    ///
    func checkGridForWinner() -> Bool {
        // loop through all elements and check if grid contains a 'winner'
        for r in 0..<rows {
            for c in 0..<cols {
                if checkSquareForWinner(r, c) { return true }
            }
        }
        return false
    }
    
    private func checkSquareForWinner(_ r: Int, _ c: Int) -> Bool {
        let currentElement = grid[r][c]
        
        // check if blank square
        if currentElement == 0 {
            return false
        }
        
        // check horizontal
        if c + 3 < cols {
            if currentElement == grid[r][c+1] && currentElement == grid[r][c+2] && currentElement == grid[r][c+3] {
                return true
            }
        }
        
        // check vertical
        if r + 3 < rows {
            if currentElement == grid[r+1][c] && currentElement == grid[r+2][c] && currentElement == grid[r+3][c] {
                return true
            }
        }
        
        // check right diag
        if r + 3 < rows && c + 3 < cols {
            if currentElement == grid[r+1][c+1] && currentElement == grid[r+2][c+2] && currentElement == grid[r+3][c+3] {
                return true
            }
        }
        
        // check left diag
        if r + 3 < rows && c - 3 >= 0 {
            if currentElement == grid[r+1][c-1] && currentElement == grid[r+2][c-2] && currentElement == grid[r+3][c-3] {
                return true
            }
        }
        
        return false
    }
}
