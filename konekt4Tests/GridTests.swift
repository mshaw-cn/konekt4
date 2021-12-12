//
//  GridTests.swift
//  konekt4Tests
//
//  Created by Michael Shaw on 12/12/21.
//

import XCTest

@testable import konekt4

class GridTests: XCTestCase {
    var grid:Grid!

    override func setUp() {
        super.setUp()
        
        grid = Grid()
    }

    override func tearDown() {
        super.tearDown()
        
        grid = nil
    }

    func testNumberOfRows() {
        XCTAssertEqual(grid.grid.count, 8)
    }
    
    func testNumberOfCols() {
        for i in 0..<8 {
            XCTAssertEqual(grid.grid[i].count, 8)
        }
    }
    
    func testHorizontal() {
        grid.grid[0][4] = 1
        grid.grid[0][5] = 1
        grid.grid[0][6] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), false)
        
        grid.grid[0][7] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), true)
        
        resetGrid()
    }
    
    func testVertical() {
        grid.grid[4][0] = 2
        grid.grid[5][0] = 2
        grid.grid[6][0] = 2
        
        XCTAssertEqual(grid.checkGridForWinner(), false)
        
        grid.grid[7][0] = 2
        
        XCTAssertEqual(grid.checkGridForWinner(), true)
        
        resetGrid()
    }
    
    func testDownDiag() {
        grid.grid[7][7] = 1
        grid.grid[6][6] = 1
        grid.grid[4][4] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), false)
        
        grid.grid[5][5] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), true)
        
        resetGrid()
    }
    
    func testUpDiag() {
        grid.grid[6][1] = 1
        grid.grid[5][2] = 1
        grid.grid[4][3] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), false)
        
        grid.grid[7][0] = 1
        
        XCTAssertEqual(grid.checkGridForWinner(), true)
        
        resetGrid()
    }


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            _ = grid.checkGridForWinner()
        }
    }
    
    func resetGrid() {
        grid.grid = Array(repeating: Array(repeating: 0, count: 8), count: 8)
    }

}
