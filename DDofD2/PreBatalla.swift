//
//  PreBatalla.swift
//  DDofD2
//
//  Created by Borja S on 19/12/2018.
//  Copyright © 2018 Borja S. All rights reserved.
//

import UIKit

var enemigo = Monstruo()

class PreBatalla: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    
    //Objetos
    @IBOutlet weak var monstruosPV: UIPickerView!
    @IBOutlet weak var btnEscoger: UIButton!
    
    
    //Auxiliares
    var monstruos : [Monstruo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cargaInicial()
        
        monstruosPV.delegate = self
        monstruosPV.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    var monstruo1 = Monstruo(nombre: "Boo", ataque: 30, defensa: 70, vida: 100, recompensa: 100, nombreImagen: "m_boo")
    
    var monstruo2 = Monstruo(nombre: "Wazowski", ataque: 40, defensa: 70, vida: 120, recompensa: 120, nombreImagen: "m_mike")
    
    var monstruo3 = Monstruo(nombre: "Boggs", ataque: 60, defensa: 50, vida: 150, recompensa: 150, nombreImagen: "m_randall")
    
    var monstruo4 = Monstruo(nombre: "Sullivan", ataque: 80, defensa: 80, vida: 150, recompensa: 170, nombreImagen: "m_sulley")
    
    var monstruo5 = Monstruo(nombre: "Groot", ataque: 100, defensa: 100, vida: 200, recompensa: 200, nombreImagen: "m_root")
    
    //Funciones
    func cargaInicial(){
        
         monstruos = [monstruo1, monstruo2, monstruo3, monstruo4, monstruo5]
        btnEscoger.isHidden = true
    }
    
    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return monstruos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let vista: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let imagen: UIImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 150))
        let nombreM: UILabel = UILabel(frame: CGRect(x: 30, y: -20, width: 150, height: 100))
        let ataqueM: UILabel = UILabel(frame: CGRect(x: 30, y: 0, width: 150, height: 100))
        let defensaM: UILabel = UILabel(frame: CGRect(x: 30, y: 20, width: 150, height: 100))
        let vidaM: UILabel = UILabel(frame: CGRect(x: 30, y: 40, width: 150, height: 100))
        let recompensaM: UILabel = UILabel(frame: CGRect(x: 30, y: 60, width: 150, height: 100))

        
        
        imagen.image = monstruos[row].imagen!
        nombreM.text = "Nombre : \(monstruos[row].nombre)"
        ataqueM.text = "Ataque : \(monstruos[row].ataque)"
        defensaM.text = "Defensa : \(monstruos[row].defensa)"
        vidaM.text = "Vida : \(monstruos[row].vida)"
        recompensaM.text = "Recompensa : \(monstruos[row].recompensa)"
        
        vista.addSubview(imagen)
        vista.addSubview(nombreM)
        vista.addSubview(ataqueM)
        vista.addSubview(defensaM)
        vista.addSubview(vidaM)
        vista.addSubview(recompensaM)
        
        
        return vista
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 170
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        enemigo = monstruos[row]
        btnEscoger.isHidden = false
        btnEscoger.setTitle("Luchar contra \(enemigo.nombre)", for: .normal)
    }
    

}
