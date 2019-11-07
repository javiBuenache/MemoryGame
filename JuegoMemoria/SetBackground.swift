import UIKit

//para utilizar la misma función en varias vistas
class SetBackground
{
    //imagen de fondo
    func wallpaper(view: UIView)
    {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "fondo")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
    }
}
