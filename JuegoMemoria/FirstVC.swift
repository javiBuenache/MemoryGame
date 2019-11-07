
import UIKit

var difficulty:Float = 0

class FirstVC: UIViewController
{
    //contador de nivel dificultad
    @IBOutlet weak var level: UILabel!
    
    //niveles de dificultad con un slider
    @IBOutlet weak var levelSlider: UISlider!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    let background:SetBackground = SetBackground()
    background.wallpaper(view: self.view)
        
    }

    //cambia el valor del slider
    @IBAction func slider(_ sender: UISlider)
    {
     level.text = String(Int(sender.value))
        difficulty = sender.value
    }

}
