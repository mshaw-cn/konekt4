//
//  grid.swift
//  konekt4
//
//  Created by Michael Shaw on 12/8/21.
//

import Foundation

class Grid: ObservableObject {
    // initialized with integer n to make nxn grid
    let n: Int
    @Published var grid: [[Int]]
    
    init(n: Int = 8) {
        self.n = n
        self.grid = Array(repeating: Array(repeating: 0, count: n), count: n)
    }
    
    /**
    This method iterates through all elements of a grid and checks for a winner

    - returns: Bool representing if a winner was found in the grid


     # Notes: #
     1. O(n) time and O(1) space

     # Example #
    ```
     // var myGrid = Grid(n: 8)
     // myGrid.checkGridForWinner()
    ```

    */
    func checkGridForWinner() -> Bool {
        // loop through all elements and check if grid contains a 'winner'
        for r in 0..<n {
            for c in 0..<n {
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
        if c + 3 < n {
            if currentElement == grid[r][c+1] && currentElement == grid[r][c+2] && currentElement == grid[r][c+3] {
                return true
            }
        }
        
        // check vertical
        if r + 3 < n {
            if currentElement == grid[r+1][c] && currentElement == grid[r+2][c] && currentElement == grid[r+3][c] {
                return true
            }
        }
        
        // check right diag
        if r + 3 < n && c + 3 < n {
            if currentElement == grid[r+1][c+1] && currentElement == grid[r+2][c+2] && currentElement == grid[r+3][c+3] {
                return true
            }
        }
        
        // check left diag
        if r + 3 < n && c - 3 >= 0 {
            if currentElement == grid[r+1][c-1] && currentElement == grid[r+2][c-2] && currentElement == grid[r+3][c-3] {
                return true
            }
        }
        
        return false
    }
}
