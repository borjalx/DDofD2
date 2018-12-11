import Foundation

class Equipacion {
    
    var arma: Item?
    var armadura: Item?
    var botas: Item?
    var casco: Item?
    var guantes: Item?
    
    init() {
        self.arma = nil
        self.armadura = nil
        self.botas = nil
        self.casco = nil
        self.guantes = nil
        
    }
    
    init(arma: Item, armadura: Item, botas: Item, casco: Item, guantes: Item) {
        self.arma = arma
        self.armadura = armadura
        self.botas = botas
        self.casco = casco
        self.guantes = guantes
    }
}


