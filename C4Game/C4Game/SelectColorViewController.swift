import UIKit

enum GameMode {
    
    case onePlayer
    case twoPlayers
}

class SelectColorViewController: UIViewController {
    
    @IBOutlet var colorButtons: [UIImageView]!
    @IBOutlet var gameModeButton: [UILabel]!
    
    var colorSelected: ChipColor = .red

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        for colorButton in colorButtons {
            
            colorButton.isUserInteractionEnabled = true
            
            let tapGesture = UITapGestureRecognizer(target: self, action: colorSelected(UITapGestureRecognizer))
            
            colorButton.addGestureRecognizer(tapGesture)
        }


    }
    
    func selectColor(sender: UITapGestureRecognizer) {
        
        if let tag = sender.view?.tag {
            
            if tag == 11 {
                
                self.view.viewWithTag(11)?.backgroundColor = UIColor.cyan
                self.view.viewWithTag(22)?.backgroundColor = UIColor.clear
                colorSelected = .red
                
            } else if tag == 22 {
                
                self.view.viewWithTag(11)?.backgroundColor = UIColor.clear
                self.view.viewWithTag(22)?.backgroundColor = UIColor.cyan
                colorSelected = .yellow
            }
        }
    
    }
    

}
