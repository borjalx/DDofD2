import UIKit

class Tienda: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //Objetos
    @IBOutlet weak var ahImagen: UIImageView!
    @IBOutlet weak var lblDinero: UILabel!
    @IBOutlet weak var ahMagia: UILabel!
    @IBOutlet weak var ahDefensa: UILabel!
    @IBOutlet weak var itemsPV: UIPickerView!
    @IBOutlet weak var lblMensajes: UILabel!
    @IBOutlet weak var btnComprar: UIButton!
    
    
    //Auxiliares
    var itemActual: Item = Item()
    var productos = [Item]()
    
    //Armas
    var espada2:Item = Item(nombre: "Espada Fuego", ataque: 100, defensa: 20, magia: 0, suerte: 10, precio: 150, tipo: "arma", nombreImagen: "espada2")
    var cetro2:Item = Item(nombre: "Cetro Hielo", ataque: 50, defensa: 30, magia: 30, suerte: 10, precio: 130, tipo: "arma", nombreImagen: "cetro2")
    var arco2:Item = Item(nombre: "Arco Letal", ataque: 50, defensa: 20, magia: 10, suerte: 20, precio: 10, tipo: "arma", nombreImagen: "arco2")
    //Armaduras
    var armadura2:Item = Item(nombre: "Armadura Metal", ataque: 0, defensa: 50, magia: 20, suerte: 20, precio: 80, tipo: "armadura", nombreImagen: "armadura2")
    //Botas
    var botas2:Item = Item(nombre: "Botas Ligeras", ataque: 0, defensa: 30, magia: 30, suerte: 30, precio: 50, tipo: "botas", nombreImagen: "botas2")
    //Cascos
    var casco2:Item = Item(nombre: "Casco Vikingo", ataque: 20, defensa: 50, magia: 0, suerte: 10, precio: 50, tipo: "casco", nombreImagen: "casco2")
    //Escudos
    var escudo2:Item = Item(nombre: "Escudo Real", ataque: 0, defensa: 50, magia: 0, suerte: 20, precio: 50, tipo: "escudo", nombreImagen: "escudo2")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cargaInicial()
        
        itemsPV.delegate = self
        itemsPV.dataSource = self

    }

    //PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //return heroina.inventario.count
        return productos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let vista: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let imagen: UIImageView = UIImageView(frame: CGRect(x: -100, y: 0, width: 100, height: 150))
        let nombreItem: UILabel = UILabel(frame: CGRect(x: 30, y: -20, width: 150, height: 100))
        let tipoItem: UILabel = UILabel(frame: CGRect(x: 30, y: 0, width: 150, height: 100))
        let ataqueItem: UILabel = UILabel(frame: CGRect(x: 30, y: 20, width: 150, height: 100))
        let defensaItem: UILabel = UILabel(frame: CGRect(x: 30, y: 40, width: 150, height: 100))
        let magiaItem: UILabel = UILabel(frame: CGRect(x: 30, y: 60, width: 150, height: 100))
        let suerteItem: UILabel = UILabel(frame: CGRect(x: 30, y: 80, width: 150, height: 100))
        let precioitem: UILabel = UILabel(frame: CGRect(x: 30, y: 100, width: 150, height: 100))
        
        
        imagen.image = productos[row].imagen!
        nombreItem.text = "Nombre : \(productos[row].nombre)"
        tipoItem.text = "Tipo : \(productos[row].tipo)"
        ataqueItem.text = "Ataque : \(productos[row].ataque)"
        defensaItem.text = "Defensa : \(productos[row].defensa)"
        magiaItem.text = "Magia : \(productos[row].magia)"
        suerteItem.text = "Suerte : \(productos[row].suerte)"
        precioitem.text = "Precio : \(productos[row].precio)"
        
        vista.addSubview(imagen)
        vista.addSubview(nombreItem)
        vista.addSubview(tipoItem)
        vista.addSubview(ataqueItem)
        vista.addSubview(defensaItem)
        vista.addSubview(magiaItem)
        vista.addSubview(suerteItem)
        vista.addSubview(precioitem)
        
        
        return vista
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 170
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnComprar.isHidden = false
        itemActual = productos[row]
        btnComprar.setTitle("Comprar \(itemActual.nombre)", for: .normal)
        //Heroina auxiliar con los mismos datos que la heroina actual
        /*var hAux:Heroe = heroina
        //Susitituimos el item actual por el de la equipación
        switch(heroina.inventario[row].tipo){
            case "arma":
                hAux.equipacion?.arma = heroina.inventario[row]
                break;
            case "armadura":
                hAux.equipacion?.armadura = heroina.inventario[row]
                break;
            case "casco":
                hAux.equipacion?.casco = heroina.inventario[row]
                break;
            case "escudo":
                hAux.equipacion?.escudo = heroina.inventario[row]
                break;
            case "botas":
                hAux.equipacion?.botas = heroina.inventario[row]
                break;
            default:
                break;
            
            
        }*/
        //Mostramos en los labels los valores de la heroina auxiliar
        /*
        ahAtaque.text = String(hAux.ataque)
        ahAtaque.textColor = getColor(numeroActual: heroina.ataque, numeroNuevo: hAux.ataque)
        ahDefensa.text = String(hAux.defensa)
        ahDefensa.textColor = getColor(numeroActual: heroina.defensa, numeroNuevo: hAux.defensa)
        ahMagia.text = String(hAux.magia)
        ahMagia.textColor = getColor(numeroActual: heroina.magia, numeroNuevo: hAux.magia)
        ahSuerte.text = String(hAux.suerte)
        ahSuerte.textColor = getColor(numeroActual: heroina.suerte, numeroNuevo: hAux.suerte)
        */
    }

    //Funciones
    
    //Función que devulve el color () de un texto dependiendo de si es mejor o peor
    /*func getColor(numeroActual: Int, numeroNuevo: Int) -> UIColor {
        //Comparamos dos números
        //Si el primero es menor al segundo devulve el color rojo
        //Si los números son iguales devuelve el color blanco
        //En caso contrario devuelve el verde
        var colorFinal = UIColor()
        
        if numeroActual > numeroNuevo {
            colorFinal = UIColor.red
        }else if numeroActual == numeroNuevo {
            colorFinal = UIColor.white
        }else if numeroActual < numeroNuevo {
            colorFinal = UIColor.green
        }
        
        return colorFinal
    }*/
    
    //Función que carga los valors de los objetos iniciales
    func cargaInicial(){

        lblDinero.text = String(heroina.dinero)
        btnComprar.isHidden = true
        
        productos.append(espada2)
        productos.append(cetro2)
        productos.append(arco2)
        productos.append(armadura2)
        productos.append(botas2)
        productos.append(casco2)
        productos.append(escudo2)
        
        /*
        ahImagen.image = heroina.imagen
        ahAtaque.text = String(heroina.ataqueReal())
        ahDefensa.text = String(heroina.defensaReal())
        ahMagia.text = String(heroina.magiaReal())
        ahSuerte.text = String(heroina.suerteReal())
        
        if heroina.inventario.isEmpty {
            lblMensajes.textColor = UIColor.red
            lblMensajes.text = "NO tienes items, ve a la tienda!"
        }
         */
        
    }
    @IBAction func adquirirItem(_ sender: Any) {
        //Si nos llega el dinero
            //Adquirimos el item :
            //Restamos el precio al dinero del usuario
            //Sustituimos el item actual
            //Mostramos un mensaje de lo sucedido
            //OPCIONAL - Nos retornan el valor del item que tenemos
        //Si NO nos llega el dinero
            //Mostramos un mensaje
        if heroina.dinero >= itemActual.precio {
            heroina.dinero -= itemActual.precio
            switch (itemActual.tipo){
            case "arma":
                heroina.equipacion?.arma = itemActual
                break;
            case "armadura":
                heroina.equipacion?.armadura = itemActual
                break;
            case "botas":
                heroina.equipacion?.botas = itemActual
                break;
            case "casco":
                heroina.equipacion?.casco = itemActual
                break;
            case "escudo":
                heroina.equipacion?.escudo = itemActual
                break;
            default:
                break;
            }
            lblMensajes.text = "Has adquirido \(itemActual.nombre)!  -\(itemActual.precio) monedas"
            lblMensajes.textColor = UIColor.green
        }else{
            let dineroNec = itemActual.precio - heroina.dinero
            lblMensajes.text = "Te faltan \(dineroNec) monedas"
            lblMensajes.textColor = UIColor.red
        }
        
        lblDinero.text = String(heroina.dinero)
        
    }
    
    //TO DO - Utilizar los valores de los items del PV y compararlos con los actuales y establecer como itemActual
    
    //Sustituir el item del PV por el de la equipación actual

}
