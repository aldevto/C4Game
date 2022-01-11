import Foundation
import UIKit

enum Tile {
    case red
    case yellow
    case empty
}

struct BoardItem {
    var indexPath: IndexPath!
    var tile: Tile!
    
    func yellowTile() -> Bool {
        return tile == Tile.yellow
    }
    
    func redTile() -> Bool {
        return tile == Tile.red
    }
    
    func emptyTile() -> Bool {
        return tile == Tile.empty
    }
    
    func tileColor() -> UIColor {
        if redTile() {
            return .red
        }
        if yellowTile() {
            return .systemYellow
        }
        return .white
    }
}
