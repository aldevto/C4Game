import Foundation
import UIKit

var board = [[BoardItem]]()

func resetBoard() {
    board.removeAll()
    
    for row in 0...5 {
        var rowArray = [BoardItem]()
        for column in 0...6 {
            let indexPath = IndexPath.init(item: column, section: row)
            let boardItem = BoardItem(indexPath: indexPath, tile: Tile.empty)
            rowArray.append(boardItem)
        }
        board.append(rowArray)
    }
}

func getBoardItem(_ indexPath: IndexPath) -> BoardItem {
    return board[indexPath.section][indexPath.item]
}

func getLowesEmptyBoardItem(_ colunm: Int) -> BoardItem? {
    
    for row in (0...5).reversed() {
        let boardItem = board[row][colunm]
        if boardItem.emptyTile() {
            return boardItem
        }
    }
    
    return nil
}

func updateBoardWithBoardItem(_ boardItem: BoardItem) {
    if let indexPath = boardItem.indexPath {
        
        board[indexPath.section][indexPath.item] = boardItem 
    }
}
