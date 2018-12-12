//
//  ViewController.swift
//  DDofD2
//
//  Created by Borja S on 06/12/2018.
//  Copyright © 2018 Borja S. All rights reserved.
//

import UIKit

var heroina = Heroe()

class ViewController: UIViewController {
    
    //Valores generales
    static var dinero = 100
    static var vida = 100
    //Utilizar los arrays para insertar en los labels la información de los personajes
    //var labelsHeroinas : [[UILabel]] = [[UILabel]]()
    //var LabelsG: [UILabel] = [UILabel]()
    //var LabelsM: [UILabel] = [UILabel]()
    //var LabelsH: [UILabel] = [UILabel]()
    
    //Items
    //Armas
    var daga: Item = Item(nombre: "Daga", ataque: 20, defensa: 10, magia: 10, suerte: 10, precio: 50, tipo: "arma", nombreImagen: "daga")
    var arcoPlastico: Item = Item(nombre: "Arco Plástico", ataque: 10, defensa: 20, magia: 10, suerte: 10, precio: 50, tipo: "arma", nombreImagen: "arcoP")
    var cetroMadera: Item = Item(nombre: "Cetro Madera", ataque: 20, defensa: 10, magia: 20, suerte: 0, precio: 50, tipo: "arma", nombreImagen: "cetroM")
    //Armadura básica
    var armaduraB: Item = Item(nombre: "Armadura Básica", ataque: 0, defensa: 20, magia: 20, suerte: 10, precio: 50, tipo: "armadura", nombreImagen: "armaduraB")
    //Casco básico
    var cascoB: Item = Item(nombre: "Casco Básico", ataque: 10, defensa: 10, magia: 10, suerte: 20, precio: 50, tipo: "casco", nombreImagen: "cascoB")
    //Escudo básico
    var escudoB: Item = Item(nombre: "Escudo Básico", ataque: 15, defensa: 15, magia: 10, suerte: 10, precio: 50, tipo: "escudo", nombreImagen: "escudoB")
    //Botas básicas
    var botasB: Item = Item(nombre: "Botas Básicas", ataque: 10, defensa: 0, magia: 15, suerte: 25, precio: 50, tipo: "botas", nombreImagen: "botasB")
    
    //Guerrera
    var guerrera = Heroe(nombre: "Isabella", ataque: 70, defensa: 30, magia: 40, suerte: 60, vida: vida, equipacion: Equipacion(), nombreImagen: "guerrera", dinero: dinero,inventario: [])
    
    //Arquera
    var arquera = Heroe(nombre: "Maxi", ataque: 50, defensa: 50, magia: 30, suerte: 70, vida: vida, equipacion: Equipacion(), nombreImagen: "arquera", dinero: dinero, inventario: [])
    
    var maga = Heroe(nombre: "Terrace", ataque: 40, defensa: 60, magia: 70, suerte: 30, vida: vida, equipacion: Equipacion(), nombreImagen: "maga", dinero: dinero, inventario: [])
    
    //Objetos
    //Guerrera - Isabella
    @IBOutlet weak var ataqueG: UILabel!
    @IBOutlet weak var defensaG: UILabel!
    @IBOutlet weak var magiaG: UILabel!
    @IBOutlet weak var suerteG: UILabel!
    //Maga - Terrace
    @IBOutlet weak var ataqueM: UILabel!
    @IBOutlet weak var defensaM: UILabel!
    @IBOutlet weak var magiaM: UILabel!
    @IBOutlet weak var suerteM: UILabel!
    //Arquera - Maxi
    @IBOutlet weak var ataqueA: UILabel!
    @IBOutlet weak var defensaA: UILabel!
    @IBOutlet weak var magiaA: UILabel!
    @IBOutlet weak var suerteA: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cargaInicial()
        
    }
    
    //Función donde se cargan los valores de los labels de las heroinas
    func cargaInicial(){
        //Guerrera
        ataqueG.text = String(guerrera.ataque)
        defensaG.text = String(guerrera.defensa)
        magiaG.text = String(guerrera.magia)
        suerteG.text = String(guerrera.suerte)
        
        //Maga
        ataqueM.text = String(maga.ataque)
        defensaM.text = String(maga.defensa)
        magiaM.text = String(maga.magia)
        suerteM.text = String(maga.suerte)
        //Arquera
        ataqueA.text = String(arquera.ataque)
        defensaA.text = String(arquera.defensa)
        magiaA.text = String(arquera.magia)
        suerteA.text = String(arquera.suerte)
    }
    
    @IBAction func escogerHeroina(_ sender: UIButton) {
        var equipacion = Equipacion(arma: Item(), armadura: armaduraB, botas: botasB, casco: cascoB, escudo: escudoB)
            switch(sender.tag){
            case 1:
                heroina = guerrera
                equipacion.arma = daga
                print("Guerrera escogida")
                break;
            case 2:
                heroina = maga
                equipacion.arma = cetroMadera
                print("Maga escogida")
                break;
            case 3:
                heroina = arquera
                equipacion.arma = arcoPlastico
                print("Arquera escogida")
                break;
            default:
                break
        }
        heroina.equipacion = equipacion
        heroina.inventario = [daga,arcoPlastico,cetroMadera,armaduraB,cascoB,botasB,escudoB]
        print("Heroina nombre = \(heroina.nombre)")
    }
}
    



