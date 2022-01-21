import UIKit
import AVFoundation

class BoardGameViewController: UIViewController {
    
    @IBOutlet weak var gameBoard: UIStackView!
    @IBOutlet var columnViews: [UIView]!
    @IBOutlet var columnButtons: [UIButton]!
    
    @IBOutlet weak var currentTurnImageView: UIImageView!
    @IBOutlet weak var currentTurnLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

}



