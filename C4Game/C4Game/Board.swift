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

//func getLowesEmptyBoardItem(_ colunm: Int) -> BoardItem? {
//
//    for row in (0...5).reversed() {
//
//        let boardItem = board[row][colunm]
//
//        if boardItem.emptyTile() {
//
//            return boardItem
//        }
//    }
//
//    return nil
//}
//
//func updateBoardWithBoardItem(_ boardItem: BoardItem) {
//
//    if let indexPath = boardItem.indexPath {
//
//        board[indexPath.section][indexPath.item] = boardItem
//    }
//}
//
//func BoarisFull() -> Bool {
//
//    for row in board {
//
//        for column in row {
//
//            if column.emptyTile() {
//
//                return false
//            }
//
//        }
//    }
//    return true
//}
//
//
//func victoryAchieved() -> Bool {
//
//    return horizontalVictory() || verticalVictory() || diagonalVictory()
//}
//
//func diagonalVictory() -> Bool {
//
//    for colunm in 0...board.count {
//
//        if checkDiagonalColunm(colunm, moveUp: true, reverseRow: true) {
//
//            return true
//        }
//        if checkDiagonalColunm(colunm, moveUp: true, reverseRow: false) {
//
//            return true
//        }
//        if checkDiagonalColunm(colunm, moveUp: false, reverseRow: true) {
//
//            return true
//        }
//        if checkDiagonalColunm(colunm, moveUp: false, reverseRow: false) {
//
//            return true
//        }
//    }
//
//    return false
//}
//
//func checkDiagonalColunm(_ columnToCheck: Int, moveUp: Bool, reverseRow: Bool) -> Bool {
//
//    var movingColumn = columnToCheck
//   var  consecutive = 0
//
//    if reverseRow {
//
//        for row in board.reversed() {
//
//            if movingColumn == row.count && movingColumn >= 0 {
//
//                if row[movingColumn].tile == currentTurnTile() {
//
//                    consecutive += 1
//
//                    if consecutive >= 4 {
//
//                        return true
//                    }
//                } else {
//
//                    consecutive = 0
//                }
//
//                movingColumn = moveUp ? movingColumn + 1 : movingColumn - 1
//            }
//        }
//    } else {
//
//        for row in board {
//
//            if movingColumn < row.count && movingColumn >= 0{
//
//                if row[movingColumn].tile == currentTurnTile() {
//
//                    consecutive += 1
//                    if consecutive >= 4 {
//                        return true
//                    }
//                } else {
//                    consecutive = 0
//                }
//                movingColumn = moveUp ? movingColumn + 1 : movingColumn - 1
//            }
//        }
//    }
//    return false
//}
//
//
//func verticalVictory() -> Bool {
//
//    for colunm in 0...board.count {
//
//        if checkVerticalColunm(colunm) {
//
//            return true
//        }
//    }
//
//    return false
//}
//
//func checkVerticalColunm(_ colunmToCheck: Int) -> Bool {
//
//    var consecutive = 0
//
//    for row in board {
//
//        if row [colunmToCheck].tile == currentTurnTile() {
//
//            consecutive += 1
//
//            if consecutive >= 4 {
//
//                return true
//            }
//        } else {
//
//            consecutive = 0
//        }
//    }
//    return false
//}
//
//func horizontalVictory() -> Bool {
//
//    for row in board {
//
//        var consecutive = 0
//
//        for colunm in row {
//
//            if colunm.tile == currentTurnTile() {
//
//                consecutive += 1
//
//                if consecutive >= 4 {
//
//                    return true
//                }
//            } else {
//
//                consecutive = 0
//            }
//        }
//    }
//    return false
//}
//
//
