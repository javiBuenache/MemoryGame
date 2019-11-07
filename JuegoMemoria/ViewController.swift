import UIKit

//almacenar imágenes
var images : [UIImage] = [#imageLiteral(resourceName: "imageUno"),#imageLiteral(resourceName: "imageDos"),#imageLiteral(resourceName: "imageTres"),#imageLiteral(resourceName: "imageCuatro"),#imageLiteral(resourceName: "imageCinco"),#imageLiteral(resourceName: "imageSeis"),#imageLiteral(resourceName: "imageSiete"),#imageLiteral(resourceName: "imageOcho")]

//crear array de números vacío
var numbers : [Int] = []

class ViewController: UIViewController
{

    //cuadro de imagen
    @IBOutlet weak var image: UIImageView!
    
    //contador
    @IBOutlet weak var counter: UILabel!
    
    //mensaje cuando acaba el tiempo aparece
    @IBOutlet weak var message: UILabel!
    
    override func viewWillAppear(_ animated: Bool)
    {
        showImage()
        
        //cambiar el fondo de pantalla dicha función se encuentra en una clase para reutilizarla en todas las pantallas.
        let background:SetBackground = SetBackground()
        background.wallpaper(view: self.view)
        
        //el contador empieza en 8 que son las imágenes que contiene el array
        counter.text = "8"
        
    }
    
    //generar número aleatorio
    func randomNumber() -> [Int]
    {
        //creo array vacío donde se guardan los números aleatorios de las imágenes
        var numberRandom:[Int] = []
        //recorre el array de imágenes
        for index in 0...images.count - 1
        {
            //cada numero se añade a cada imagen
            numberRandom.append(index)
        }
        numberRandom.shuffle()//mezclar imágenes
        
    return numberRandom //devuelve número de cada imagen
    }
    //creo una variable para de segundos y poder cambiar el intervalo de tiempo de las imágenes.
    var seconds: Float = 0
    
    // se muestran las imágenes con mayor rapidez o más despacio, según la opción del usuario, en el nivel de dificultad
    func showImage()
    {
        //el indice empieza en cero
        var index = 0
        
        difficultyLevel()
        
        //guardo los números aleatorios de las imágenes en un array vacío
        numbers = randomNumber()
        
        //el mensaje esta oculto
         self.message.isHidden = true
        
        //temporizador de cada imagen
        Timer.scheduledTimer(withTimeInterval: TimeInterval(seconds), repeats: true, block:
            {
            timer in
                
                //el index es cero menos la longuitud del array 
                if index < images.count
                {
                    //muestra cada imagen desordenada
                    self.image.image = images[numbers[index]]
                    index += 1//muestra cada imagen en orden
                    
                    //muestra un contador de tiempo
                    let contador = 8 - index
                    self.counter.text! = "\(contador)"
                    if self.counter.text! == "0"
                    {
                        //el mensaje se muestra
                        self.message.isHidden = false
                    }
                }
                else
                {
                 //el timer se repite infinito, con este metódo paramos el timer.
                 timer.invalidate()
                    
                    //cuando se muestran todas las imágenes se muestra la siguiente vista
                   self.performSegue(withIdentifier: "threeScene", sender: nil)
                }
            })
    }
    
    //según la elección del usuario con el nivel de dificultad el tiempo de intervalo de cada imagen varía
    func difficultyLevel()
    {
        switch difficulty{
        case 0:
            seconds = 3
        case 1:
            seconds = 2
        case 2:
            seconds = 1
        case 3:
            seconds = 0.5
        default:
            seconds = 2
        }
    }
    
}

