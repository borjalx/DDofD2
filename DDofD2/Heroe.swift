import Foundation
import UIKit


class Heroe {
    
    var nombre: String
    var ataque: Int
    var defensa: Int
    var magia: Int
    var suerte: Int
    var vida: Int
    var imagen: UIImage?
    var equipacion: Equipacion?
    var inventario: [Item]
    var dinero: Int
    
    init() {
        self.nombre = ""
        self.ataque = 0
        self.defensa = 0
        self.magia = 0
        self.suerte = 0
        self.vida = 0
        self.dinero = 0
        self.imagen = UIImage()
        self.equipacion = nil
        self.inventario = []
    }
    
    init(nombre:String, ataque:Int, defensa: Int, magia: Int, suerte: Int, vida: Int, equipacion: Equipacion, nombreImagen: String, dinero: Int, inventario: [Item]) {
        self.nombre = nombre
        self.ataque = ataque
        self.defensa = defensa
        self.magia = magia
        self.suerte = suerte
        self.vida = vida
        self.imagen = UIImage(named: nombreImagen)
        self.equipacion = equipacion
        self.dinero = dinero
        self.inventario = inventario
    }
    
    func ataqueReal() -> Int{
        var ataqueReal = self.ataque
        ataqueReal += equipacion?.arma?.ataque ?? 0
        ataqueReal += equipacion?.armadura?.ataque ?? 0
        ataqueReal += equipacion?.botas?.ataque ?? 0
        ataqueReal += equipacion?.casco?.ataque ?? 0
        ataqueReal += equipacion?.escudo?.ataque ?? 0
        return ataqueReal
    }
    
    func defensaReal() -> Int{
        var defensaReal = self.defensa
        defensaReal += equipacion?.arma?.defensa ?? 0
        defensaReal += equipacion?.armadura?.defensa ?? 0
        defensaReal += equipacion?.botas?.defensa ?? 0
        defensaReal += equipacion?.casco?.defensa ?? 0
        defensaReal += equipacion?.escudo?.defensa ?? 0
        return defensaReal
    }
    
    func magiaReal() -> Int{
        var magiaReal = self.magia
        magiaReal += equipacion?.arma?.magia ?? 0
        magiaReal += equipacion?.armadura?.magia ?? 0
        magiaReal += equipacion?.botas?.magia ?? 0
        magiaReal += equipacion?.casco?.magia ?? 0
        magiaReal += equipacion?.escudo?.magia ?? 0
        return magiaReal
    }
    
    func suerteReal() -> Int{
        var suerteReal = self.suerte
        suerteReal += equipacion?.arma?.suerte ?? 0
        suerteReal += equipacion?.armadura?.suerte ?? 0
        suerteReal += equipacion?.botas?.suerte ?? 0
        suerteReal += equipacion?.casco?.suerte ?? 0
        suerteReal += equipacion?.escudo?.suerte ?? 0
        return suerteReal
    }
    
}
