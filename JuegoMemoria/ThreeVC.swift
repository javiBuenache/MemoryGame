
import UIKit
//añadir los protocolos source y delegate
class ThreeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    //collectionView
    @IBOutlet weak var collection: UICollectionView!
    
    //botón de retorno a la pantalla principal
    @IBOutlet weak var repeatPlay: UIButton!
    
    //avisos
    @IBOutlet weak var notice: UILabel!
    
    //cantador de vidas
    @IBOutlet weak var life: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collection.dataSource = self
        
        collection.delegate = self
        
         //cambiar el fondo de pantalla dicha función se encuentra en una clase para reutilizarla en todas las pantallas.
        let background:SetBackground = SetBackground()
        background.wallpaper(view: self.view)
    }
    
    //número de celdas
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }
    //rellenar las celdas
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! ImageCell
        cell.image.image = images[indexPath.row]
        return cell
    }
    
//acertar la imagen o fallar
  var index = 0
  var lifeCounter = 4
 
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
   {
    repeatPlay.isHidden = true
    //la celda del collection haciendo casting
    let cell = collectionView.cellForItem(at: indexPath) as! ImageCell
    
    notice.isHidden = true
    
        //si el array de imagenes del aleatorio es igual a la celda
       if images[numbers[index]] == cell.image.image
       {
        cell.isHidden = true//desaparece la celda
        index += 1//recorre el array aleatorio
        print("cell")
        notice.isHidden = false
        notice.text = "¡¡Acertaste!!"
        
            //cuando el indice del array aleatorio es igual a la longuitud del array,al hacer click de cada imagen en el orden del sistema aleaotrio, el usuario gana, siempre que no agote las 4 vidas
                if index == images.count
                {
                    win()
                }
       }
        else
        {
            //cada fallo se resta una vida
            print("error")
            lifeCounter -= 1
            notice.isHidden = false
            notice.text = "Has fallado.."
            print(lifeCounter)
            life.text! = "\(lifeCounter)"
        }
    
        //Cuando el contador de vidas llega a cero el usuario pierde
        if lifeCounter == 0
        {
            lose()
        }
    }
    
    //cuando gana realiza las acciones
    func win()
    {
        notice.text = "¡¡PERFECTO!!"
        repeatPlay.isHidden = false
        print("has ganado")
    }
    
    //cuando pierde realiza las acciones
    func lose()
    {
        notice.text = "¡¡GAME OVER!!"
        repeatPlay.isHidden = false
        collection.alpha = 0
        print("has perdido")
    }
    
    //vuelve a la pantalla principal
    @IBAction func returnMainScreen(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "firstVC", sender: nil)
    }
}

