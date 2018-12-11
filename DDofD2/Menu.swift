import UIKit

class Menu: UIViewController {
    
    //Objetos
    @IBOutlet weak var ahImagen: UIImageView!
    @IBOutlet weak var ahAtaque: UILabel!
    @IBOutlet weak var ahDefensa: UILabel!
    @IBOutlet weak var ahMagia: UILabel!
    @IBOutlet weak var ahSuerte: UILabel!
    @IBOutlet weak var ahNombre: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cargaInicial()
    }
    
    func cargaInicial(){
        
        ahImagen.image = heroina.imagen
        ahAtaque.text = String(heroina.ataqueReal())
        ahDefensa.text = String(heroina.defensaReal())
        ahMagia.text = String(heroina.magiaReal())
        ahSuerte.text = String(heroina.suerteReal())
        ahNombre.text = heroina.nombre
        
    }

}
