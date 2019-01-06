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

    var nDados = 0
    
    //Enemigo
    @IBOutlet weak var imgEnemigo: UIImageView!
    @IBOutlet weak var lblAtaqueE: UILabel!
    @IBOutlet weak var lblDefensaE: UILabel!
    @IBOutlet weak var lblVidaE: UILabel!
    @IBOutlet weak var pve: UIPickerView!
    
    //var nDadosE = 0
    
    @IBOutlet weak var btnAtacar: UIButton!
    
    //Dados
    //Array Dados
    var dadosE:[UIImage] = Array()
    var dadosH:[UIImage] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pve.delegate = self
        pvh.delegate = self
        
        pve.dataSource = self
        pve.dataSource = self
        
        cargaInicial()
        // Do any additional setup after loading the view.
    }
    

    func cargaInicial(){
        imgHeroina.image = heroina.imagen
        imgEnemigo.image = enemigoActual.imagen
        actualizarInfo()
        addDadosArray()
    }
    
    func actualizarInfo() {
        lblAtaqueH.text = String(heroina.ataqueReal())
        lblDefensaH.text = String(heroina.defensaReal())
        lblVidaH.text = String(heroina.vida)

        lblAtaqueE.text = String(enemigoActual.ataque)
        lblDefensaE.text = String(enemigoActual.defensa)
        lblVidaE.text = String(enemigoActual.vida)
    }
    
    //Función para añadir los dados a los arrays
    func addDadosArray(){
        var i = 1
        repeat{
            var nombreH = "dice"+String(i)
            var imgH = UIImage(named: nombreH)
            
            dadosH.append(UIImage(named: "dice1")!)
            
            var nombreE = "dice"+String(i)+"U"
            var imgE = UIImage(named: nombreE)
            //dadosE.append(imgE!)
            dadosH.append(UIImage(named: "dice1")!)
            
            i=i+1
        }while i < 13
    }
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        /*if(heroina.ataqueReal() >= 100){
            return 3
        }else if(heroina.ataqueReal() >= 10){
            return 2
        }else{
            return 1
        }*/
        //if(pickerView.tag == 1){
            if(heroina.ataque >= 200){
                nDados = 3
                return 3
            }else if(heroina.ataque >= 100){
                nDados = 2
                return 2
            }else{
                nDados = 1
                return 1
            }
        /*}else{
            if(enemigoActual.ataque >= 200){
                nDadosE = 3
                return 3
            }else if(enemigoActual.ataque >= 100){
                nDadosE = 3
                return 2
            }else{
                nDadosE = 3
                return 1
            }
        }*/
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 1:
            return dadosE.count
        case 2:
            return dadosH.count
        default:
            return 12
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let vista: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let imagen: UIImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 150))
        
        switch component {
        case 1:
            imagen.image = dadosE[row]
            vista.addSubview(imagen)
            
            return vista
        case 2:
            imagen.image = dadosH[row]
            vista.addSubview(imagen)
            
            return vista
        default:
            return vista
        }
        
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 150
    }
    
    @IBAction func atacar(_ sender: Any) {
        var resDadosEnemigo = 0
        var resDadosHeroina = 0
        //Obtenemos posiciones random de los dados de la heroina
        for i in 1...nDados{
            //Obtenemos el número random del dado nºi
            let nRandomH = Int.random(in: 0 ... 12)
            //Movemos el pv de los dados
            pve.selectRow(nRandomH, inComponent: i, animated: true)
            //Añadimos al resultado de los dados el resultado del dado nºi
            resDadosHeroina += nRandomH
            print("nRandomH = " + String(nRandomH))
        }
        
        //Obtenemos posiciones random de los dados del enemigo
        for i in 1...nDados{
            //Obtenemos el número random del dado nºi
            let nRandomE = Int.random(in: 0 ... 12)
            //Movemos el pv de los dados
            pve.selectRow(nRandomE,inComponent: i,animated: true)
            //Añadimos al resultado de los dados el resultado del dado nºi
            resDadosEnemigo += nRandomE
            print("nRandomE = " + String(nRandomE))
        }
        
        //Ataque de la heroina
        let ataqueH = resDadosHeroina
        print("ataqueH = " + String(ataqueH))
        //Ataque del enemigo
        let ataqueE = resDadosEnemigo
        print("ataqueE = " + String(ataqueE))
        
        //Si el ataque de la heroina es mayor a la defensa del enemigo
        if(ataqueH > enemigo.defensa){
            //Cantidad de vida que se le quitará al enemigo
            let resAtaqueH = ataqueH - enemigo.defensa
            if((enemigo.vida - resAtaqueH) <= 0){
                enemigo.vida = 0
            }else{
                enemigo.vida = enemigo.vida - resAtaqueH
            }
            print("resAtaqueH = " + String(resAtaqueH))
            //En caso contrario
        }else{
            //No le quitamos vida
            print("No quitamos vida a Enemigo")
        }
        
        //Si el ataque del enemigo es mayor a la defensa de la heroina
        if(ataqueE > heroina.defensa){
            //Cantidad de vida que se le quitará a la heroina
            var resAtaqueE = ataqueE - heroina.defensa
            if((heroina.vida - resAtaqueE) <= 0){
                heroina.vida = 0
            }else{
                heroina.vida = heroina.vida - resAtaqueE
            }
            print("resAtaqueE = " + String(resAtaqueE))
            //en caso contrario
        }else{
            //No le quitamos vida
            print("No quitamos vida a Heroina")
        }
        
        //Comprobamos si alguno ya no tiene vida
        if(heroina.vida <= 0 || enemigo.vida <= 0){
            //Si el enemigo no tiene vida pero la heroina si (gana heroina)
            if(enemigo.vida <= 0 && heroina.vida > 0){
                //se le dan las monedas correspondientes y la experiencia
                heroina.dinero += enemigo.recompensa
                //heroina.experiencia += enemigo.experiencia
                //se le reinicia la vida a la inicial
                heroina.vida = 100
                //Se esconde el botón de atacar
                btnAtacar.isHidden = true
                //Se le muestra un botón para volver a la pantalla de escoger enemigo con un mensaje avisando que ha derrotado al enemigo y lo que ha ganado
                //btnVictory.isHidden = false
                
                //Si ninguno tiene vida (empate)
            }else if(heroina.vida <= 0 && enemigo.vida <= 0){
                //Se le muestra el botón para volver a escoger heroina
                //btnLose.isHidden = true
                //Si la heroina no tiene vida pero el enemigo si (gana enemigo)
            }else if(heroina.vida <= 0 && enemigo.vida > 0){
                //Se vuelve a la pantalla para escoger heroina
                
                //btnLose.isHidden = true
                //Se le reinician los valores iniciales al enemigo¿? - No hace falta ya que obtenemos una copia del enemigo
            }
            
            //Escondemos el botón de atacar
            btnAtacar.isHidden = true
        }
        //En caso de haber alguno sin vida se acaba la batalla
        
        //Se actualizan los valores de los labels para informar al usuario del estado actual de la batalla
        actualizarInfo()    }
    
}
