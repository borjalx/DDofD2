import UIKit

class Inventario: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    //Objetos
    @IBOutlet weak var ahImagen: UIImageView!
    @IBOutlet weak var ahAtaque: UILabel!
    @IBOutlet weak var ahMagia: UILabel!
    @IBOutlet weak var ahDefensa: UILabel!
    @IBOutlet weak var ahSuerte: UILabel!
    @IBOutlet weak var itemsPV: UIPickerView!
    @IBOutlet weak var lblMensajes: UILabel!
    
    let arrayItems: [Item] = [(heroina.equipacion?.arma)!,(heroina.equipacion?.armadura)!,(heroina.equipacion?.casco)!,(heroina.equipacion?.escudo)!,(heroina.equipacion?.botas)!]
    
    //Auxiliares
    //var itemActual: Item = Item()
    
    
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
        return arrayItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let vista: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        let imagen: UIImageView = UIImageView(frame: CGRect(x: -120, y: 0, width: 100, height: 150))
        let nombreItem: UILabel = UILabel(frame: CGRect(x: 10, y: -20, width: 150, height: 100))
        let tipoItem: UILabel = UILabel(frame: CGRect(x: 10, y: 0, width: 150, height: 100))
        let ataqueItem: UILabel = UILabel(frame: CGRect(x: 10, y: 20, width: 150, height: 100))
        let defensaItem: UILabel = UILabel(frame: CGRect(x: 10, y: 40, width: 150, height: 100))
        let magiaItem: UILabel = UILabel(frame: CGRect(x: 10, y: 60, width: 150, height: 100))
        let suerteItem: UILabel = UILabel(frame: CGRect(x: 10, y: 80, width: 150, height: 100))
        
        
        
        imagen.image = arrayItems[row].imagen!
        nombreItem.text = "Nombre : \(arrayItems[row].nombre)"
        tipoItem.text = "Tipo : \(arrayItems[row].tipo)"
        ataqueItem.text = "Ataque : \(arrayItems[row].ataque)"
        defensaItem.text = "Defensa : \(arrayItems[row].defensa)"
        magiaItem.text = "Magia : \(arrayItems[row].magia)"
        suerteItem.text = "Suerte : \(arrayItems[row].suerte)"
        
        
        vista.addSubview(imagen)
        vista.addSubview(nombreItem)
        vista.addSubview(tipoItem)
        vista.addSubview(ataqueItem)
        vista.addSubview(defensaItem)
        vista.addSubview(magiaItem)
        vista.addSubview(suerteItem)

        
        return vista
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 170
    }
    /*
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //Heroina auxiliar con los mismos datos que la heroina actual
        let hAux:Heroe = heroina
        
        //Array auxiliar de los items
        
        
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
            
            
        }
        //Mostramos en los labels los valores de la heroina auxiliar
        
        ahAtaque.text = String(hAux.ataque)
        ahAtaque.textColor = getColor(numeroActual: heroina.ataque, numeroNuevo: hAux.ataque)
        ahDefensa.text = String(hAux.defensa)
        ahDefensa.textColor = getColor(numeroActual: heroina.defensa, numeroNuevo: hAux.defensa)
        ahMagia.text = String(hAux.magia)
        ahMagia.textColor = getColor(numeroActual: heroina.magia, numeroNuevo: hAux.magia)
        ahSuerte.text = String(hAux.suerte)
        ahSuerte.textColor = getColor(numeroActual: heroina.suerte, numeroNuevo: hAux.suerte)
        
    }
    */
    
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
    }
     */
    
    //Función que carga los valors de los objetos iniciales
    func cargaInicial(){
        
        ahImagen.image = heroina.imagen
        ahAtaque.text = String(heroina.ataqueReal())
        ahDefensa.text = String(heroina.defensaReal())
        ahMagia.text = String(heroina.magiaReal())
        ahSuerte.text = String(heroina.suerteReal())
        
        /*
        if heroina.inventario.isEmpty {
            lblMensajes.textColor = UIColor.red
            lblMensajes.text = "NO tienes items, ve a la tienda!"
        }
         */
        
    }
    
    //TO DO - Utilizar los valores de los items del PV y compararlos con los actuales y establecer como itemActual
    
    //Sustituir el item del PV por el de la equipación actual
    /*@IBAction func utilizarItem(_ sender: Any) {
        //Buscamos el item por el que sustituiremos
        //Sustituimos el item de la equipación por el del PV
        //Avisamos al cliente con un mensaje
        switch itemActual.tipo {
        case "armadura":
            heroina.equipacion?.armadura = itemActual
            lblMensajes.textColor = UIColor.green
            lblMensajes.text = "Armadura actualizada"
            break
        case "arma":
            heroina.equipacion?.arma = itemActual
            lblMensajes.textColor = UIColor.green
            lblMensajes.text = "Arma actualizada"
            break
        case "casco":
            heroina.equipacion?.casco = itemActual
            lblMensajes.textColor = UIColor.green
            lblMensajes.text = "Casco actualizado"
            break
        case "guante":
            heroina.equipacion?.armadura = itemActual
            lblMensajes.textColor = UIColor.green
            lblMensajes.text = "Armadura actualizada"
            break
        case "botas":
            heroina.equipacion?.botas = itemActual
            lblMensajes.textColor = UIColor.green
            lblMensajes.text = "Botas actualizada"
        default:
            break
        }
        
    }
     */
}
