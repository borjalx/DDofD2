import Foundation
import UIKit

class Monstruo{
    
    var nombre: String
    var ataque: Int
    var defensa: Int
    var vida: Int
    var recompensa: Int
    var imagen: UIImage?
    
    init() {
        self.nombre = ""
        self.ataque = 0
        self.defensa = 0
        self.vida = 0
        self.recompensa = 0
        self.imagen = UIImage()
    }
    
    init(nombre: String, ataque: Int, defensa: Int, vida: Int, recompensa: Int, nombreImagen: String) {
        self.nombre = nombre
        self.ataque = ataque
        self.defensa = defensa
        self.vida = vida
        self.recompensa = recompensa
        self.imagen = UIImage(named: nombreImagen)!
    }
    
}
