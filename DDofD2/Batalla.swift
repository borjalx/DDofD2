//
//  Batalla.swift
//  DDofD2
//
//  Created by Borja S on 27/12/2018.
//  Copyright © 2018 Borja S. All rights reserved.
//

import UIKit

class Batalla: UIViewController {

    
    //Objetos
    //Heroina
    @IBOutlet weak var imgHeroina: UIImageView!
    @IBOutlet weak var lblAtaqueH: UILabel!
    @IBOutlet weak var lblDefensaH: UILabel!
    @IBOutlet weak var lblVidaH: UILabel!
    //Enemigo
    @IBOutlet weak var imgEnemigo: UIImageView!
    @IBOutlet weak var lblAtaqueE: UILabel!
    @IBOutlet weak var lblDefensaE: UILabel!
    @IBOutlet weak var lblVidaE: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cargaInicial()
        // Do any additional setup after loading the view.
    }
    

    func cargaInicial(){
        imgHeroina.image = heroina.imagen
        imgEnemigo.image = enemigoActual.imagen
        actualizarInfo()
    }
    
    func actualizarInfo() {
        lblAtaqueH.text = String(heroina.ataqueReal())
        lblDefensaH.text = String(heroina.defensaReal())
        lblVidaH.text = String(heroina.vida)

        lblAtaqueE.text = String(enemigoActual.ataque)
        lblDefensaE.text = String(enemigoActual.defensa)
        lblVidaE.text = String(enemigoActual.vida)
    }
    

}
