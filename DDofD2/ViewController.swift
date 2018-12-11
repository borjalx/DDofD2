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
    

    var guerrera = Heroe(nombre: "Isabella", ataque: 70, defensa: 30, magia: 40, suerte: 60, vida: vida, equipacion: Equipacion(), nombreImagen: "guerrera", dinero: dinero,inventario: [])
    
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
            switch(sender.tag){
            case 1:
                heroina = guerrera
                print("Guerrera escogida")
                break;
            case 2:
                heroina = maga
                print("Maga escogida")
                break;
            case 3:
                heroina = arquera
                print("Arquera escogida")
                break;
            default:
                break
        }
        print("Heroina nombre = \(heroina.nombre)")
    }
}
    



