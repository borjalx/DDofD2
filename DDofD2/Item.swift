import Foundation
import UIKit

class Item{
    
    var nombre: String
    var ataque: Int
    var defensa: Int
    var magia: Int
    var suerte: Int
    var precio: Int
    var tipo: String
    var imagen: UIImage?
    
    init() {
        self.nombre = ""
        self.ataque = 0
        self.defensa = 0
        self.magia = 0
        self.suerte = 0
        self.precio = 0
        self.tipo = ""
        self.imagen = UIImage()
    }
    
    init(nombre:String, ataque:Int, defensa: Int, magia: Int, suerte: Int, precio: Int, tipo: String, nombreImagen: String) {
        self.nombre = nombre
        self.ataque = ataque
        self.defensa = defensa
        self.magia = magia
        self.suerte = suerte
        self.precio = precio
        self.tipo = tipo
        self.imagen = UIImage(named: nombreImagen)
    }
    
}
