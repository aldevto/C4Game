import Foundation
import UIKit


enum Turn {
    case red
    case yellow
}

var currentTurn = Turn.yellow

func toggleTurn(_ turnImage: UIImageView) {
    
    if yellowTurn() {
        currentTurn = Turn.red
        turnImage.tintColor = .red
    } else {
        currentTurn = Turn.yellow
        turnImage.tintColor = .systemYellow
    }
}


func yellowTurn() -> Bool {
    
    return currentTurn == Turn.yellow
}

func redTurn() -> Bool {
    
    return currentTurn == Turn.red
}

func currentTurnTile() -> Tile {
    
    return yellowTurn() ? Tile.yellow : Tile.red
}

func currentTurnColor() -> UIColor {
    
    return yellowTurn() ? .systemYellow : .red
}

func currentTurnTile() -> String {
    
    return yellowTurn() ? "Gano El Amarillo!" : "Gano El Rojo"
}


