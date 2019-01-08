//
//  Batalla.swift
//  DDofD2
//
//  Created by Borja S on 27/12/2018.
//  Copyright © 2018 Borja S. All rights reserved.
//

import UIKit

class Batalla: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //Objetos
    var enemigoActual: Monstruo = enemigo
    
    //Heroina
    @IBOutlet weak var imgHeroina: UIImageView!
    @IBOutlet weak var lblAtaqueH: UILabel!
    @IBOutlet weak var lblDefensaH: UILabel!
    @IBOutlet weak var lblVidaH: UILabel!
    @IBOutlet weak var pvh: UIPickerView!
    let mediaH = (Double(heroina.magiaReal())*0.3) + (Double(heroina.suerteReal())*0.3) + (Double(heroina.ataqueReal())*0.4)
    var nDadosH = 0
    
    //Enemigo
    @IBOutlet weak var imgEnemigo: UIImageView!
    @IBOutlet weak var lblAtaqueE: UILabel!
    @IBOutlet weak var lblDefensaE: UILabel!
    @IBOutlet weak var lblVidaE: UILabel!
    @IBOutlet weak var pve: UIPickerView!
    
    var nDadosE = 0
    
    @IBOutlet weak var btnAtacar: UIButton!
    @IBOutlet weak var btnVolver: UIButton!
    @IBOutlet weak var btnLose: UIButton!
    
    @IBOutlet weak var lblMensajes: UILabel!
    //Dados
    //Array Dados
    //var dadosE:[UIImage] = Array()
    //var dadosH:[UIImage] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pve.delegate = self
        pvh.delegate = self
        
        pve.dataSource = self
        pvh.dataSource = self
        
        pve.isUserInteractionEnabled = false
        pvh.isUserInteractionEnabled = false
        
        cargaInicial()
        // Do any additional setup after loading the view.
    }
    

    func cargaInicial(){
        imgHeroina.image = heroina.imagen
        imgEnemigo.image = enemigoActual.imagen
        lblMensajes.text = ""
        btnLose.isHidden = true
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
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        if(pickerView == pvh){
            if(mediaH >= 199){
                nDadosH = 3
                print("ndadosh =" + String(nDadosH))
                return 3
            }else if(heroina.ataqueReal() >= 99){
                nDadosH = 2
                print("ndadosh =" + String(nDadosH))
                return 2
            }else{
                nDadosH = 1
                print("ndadosh =" + String(nDadosH))
                return 1
            }
            
        }else{
            if(enemigoActual.ataque > 199){
                nDadosE = 3
                print("ndadose =" + String(nDadosE))
                return 3
            }else if(enemigoActual.ataque > 99){
                nDadosE = 2
                print("ndadose =" + String(nDadosE))
                return 2
            }else{
                nDadosE = 1
                print("ndadose =" + String(nDadosE))
                return 1
            }
            
        }
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 12
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let vista: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        let imagen: UIImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 90, height: 90))
        
        var nombreImagen = "dice"+String(row+1)
        
        if(pickerView == pve){
            nombreImagen = "dice"+String(row+1)+"U"
        }
        
        imagen.image = UIImage(named: nombreImagen)
        vista.addSubview(imagen)
            
        return vista
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 120
    }
    
    @IBAction func atacar(_ sender: Any) {
        var resDadosEnemigo = 0
        var resDadosHeroina = 0
        //Obtenemos posiciones random de los dados de la heroina
        
        for i in 0...nDadosH-1{
            print("Damos dados heroe")
            //Obtenemos el número random del dado nºi
            let nRandomH = Int.random(in: 0 ... 11)
            print("nRandomH = " + String(nRandomH))
            //Movemos el pv de los dados
            pvh.selectRow(nRandomH, inComponent: i, animated: true)
            //Añadimos al resultado de los dados el resultado del dado nºi
            print("i = " + String(i))
            resDadosHeroina += nRandomH+1
            print("resDadosHeroina = " + String(resDadosHeroina))
        }
        
        //Obtenemos posiciones random de los dados del enemigo
        for i in 0...nDadosE-1{
            //Obtenemos el número random del dado nºi
            let nRandomE = Int.random(in: 0 ... 11)
            //Movemos el pv de los dados
            pve.selectRow(nRandomE,inComponent: i,animated: true)
            //Añadimos al resultado de los dados el resultado del dado nºi
            resDadosEnemigo += nRandomE
            print("nRandomE = " + String(nRandomE))
        }
        
        //Ataque de la heroina
        print("mediah = " + String(mediaH))
        let ataqueH = Int((Double(resDadosHeroina) * mediaH)/20)
        print("ataqueH = " + String(ataqueH))
        //Ataque del enemigo
        let ataqueE = Int((Double(resDadosEnemigo) * Double(enemigo.ataque))/2)
        print("ataqueE = " + String(ataqueE))
        
        //Si el ataque de la heroina es mayor a la defensa del enemigo
        if(ataqueH > enemigo.defensa){
            //Cantidad de vida que se le quitará al enemigo
            let resAtaqueH = ataqueH - enemigo.defensa
            lblMensajes.text = "-\(resAtaqueH) de vida a Enemigo."
            if((enemigo.vida - resAtaqueH) <= 0){
                enemigo.vida = 0
            }else{
                enemigo.vida = enemigo.vida - resAtaqueH
            }
            print("resAtaqueH = " + String(resAtaqueH))
            //En caso contrario
        }else{
            //No le quitamos vida
            lblMensajes.text = "No quitamos vida a Enemigo."
        }
        
        //Si el ataque del enemigo es mayor a la defensa de la heroina
        if(ataqueE > heroina.defensaReal()){
            //Cantidad de vida que se le quitará a la heroina
            let resAtaqueE = ataqueE - heroina.defensaReal()
            lblMensajes.text = lblMensajes.text! + "-\(resAtaqueE) de vida a Heroina"
            if((heroina.vida - resAtaqueE) <= 0){
                heroina.vida = 0
            }else{
                heroina.vida = heroina.vida - resAtaqueE
            }
            print("resAtaqueE = " + String(resAtaqueE))
            //en caso contrario
        }else{
            //No le quitamos vida
            lblMensajes.text = lblMensajes.text! + "Enemigo no nos hiere"
        }
        
        //Comprobamos si alguno ya no tiene vida
        //if(heroina.vida <= 0 || enemigo.vida <= 0){
            //Si el enemigo no tiene vida pero la heroina si (gana heroina)
            if(enemigo.vida <= 0 && heroina.vida > 0){
                //se le dan las monedas correspondientes y la experiencia
                heroina.dinero += enemigo.recompensa
                //heroina.experiencia += enemigo.experiencia
                //se le reinicia la vida a la inicial
                heroina.vida = 100
                //Se esconde el botón de atacar
                btnAtacar.isHidden = true
                lblMensajes.text = "Has Ganado. +\(enemigo.recompensa) monedas"
                //Se le muestra un botón para volver a la pantalla de escoger enemigo con un mensaje avisando que ha derrotado al enemigo y lo que ha ganado
                //btnVictory.isHidden = false
                
                //Si ninguno tiene vida (empate)
            //}else if(heroina.vida <= 0 && enemigo.vida <= 0){
                //Se le muestra el botón para volver a escoger heroina
                //btnLose.isHidden = true
                //Si la heroina no tiene vida pero el enemigo si (gana enemigo)
                //Escondemos el botón de atacar
                //btnAtacar.isHidden = true
            }
            if heroina.vida <= 0{
                //Se vuelve a la pantalla para escoger heroina
                //Escondemos el botón de atacar
                btnAtacar.isHidden = true
                btnVolver.isHidden = true
                lblMensajes.text = "Has perdido. Vuelve a intentarlo"
                btnLose.isHidden = false
                //Se le reinician los valores iniciales al enemigo¿? - No hace falta ya que obtenemos una copia del enemigo
            }
            
        
        //}
        //En caso de haber alguno sin vida se acaba la batalla
        
        //Se actualizan los valores de los labels para informar al usuario del estado actual de la batalla
        actualizarInfo()
        
    }
    
}
