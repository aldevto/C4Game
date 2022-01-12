import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var turnImage: UIImageView!
    
    var redScore = 0
    var yellowScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        resetBoard()
        setCellWidthHeight()
    }
    
    func setCellWidthHeight() {
            let width = collectionView.frame.size.width / 10
            let height = collectionView.frame.size.height / 7
            let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: width, height: height)
        }
    
    func resultAlert(_ title: String) {
        let message = "/n:Rojo: \(String(redScore)) /n:Amarillo: \(String(yellowScore))"
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reiniciar", style: .default, handler: { [self] (_) in
            resetBoard()
            resetCells()
        }))
        self.present(ac, animated: true)
    }
    
    func resetCells() {
        for cell in collectionView.visibleCells as! [BoardCell] {
            cell.image.tintColor = .systemBackground
        }
    }
}


// MARK: DataSource Extension

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in cv: UICollectionView) -> Int {
        return board.count
    }
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return board[section].count
    }
    
    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cv.dequeueReusableCell(withReuseIdentifier: "idCell", for: indexPath) as! BoardCell
        
        let boardItem = getBoardItem(indexPath)
        cell.image.tintColor = boardItem.tileColor()
        return cell
    }

}

// MARK: Delegate Extension

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ cv: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let column = indexPath.item
        
        if var boardItem = getLowesEmptyBoardItem(column) {
            
            if let cell = collectionView.cellForItem(at: boardItem.indexPath) as? BoardCell {
                
                cell.image.tintColor = currentTurnColor()
                boardItem.tile = currentTurnTile()
                updateBoardWithBoardItem(boardItem)
                
                if victoryAchieved() {
                    
                    if yellowTurn() {
                        yellowScore += 1
                    }
                    if redTurn() {
                        redScore += 1
                    }
                    resultAlert(currentTurnVictoryMessage())

                }
                
                if BoarisFull() {
                    resultAlert("Empate")
                }
                toggleTurn(turnImage)

            }
        }
    }
        
}


