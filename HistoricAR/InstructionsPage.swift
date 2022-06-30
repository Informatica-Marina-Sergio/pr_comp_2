import Foundation
import UIKit

class InstructionsPage: UIViewController, UIScrollViewDelegate {
    
    private let logoTitle: UILabel = {
        let logoTitle = UILabel()
        logoTitle.textAlignment = .center
        logoTitle.text = "HistoricAR"
        logoTitle.textColor = UIColor(hex:0x56C271)
        logoTitle.font = logoTitle.font.withSize(60)
        return logoTitle
    }()
    
    private let logoSubtitle: UILabel = {
        let logoSubtitle = UILabel()
        logoSubtitle.center = CGPoint(x: 160, y: 285)
        logoSubtitle.textAlignment = .center
        logoSubtitle.text = "Realidad aumentada en la España Histórica"
        logoSubtitle.lineBreakMode = .byWordWrapping
        logoSubtitle.numberOfLines = 2
        logoSubtitle.textColor = UIColor(hex:0x56C271)
        logoSubtitle.font = logoSubtitle.font.withSize(16)
        return logoSubtitle
    }()
    
    private let instructionsText: UILabel = {
        let label = CGRect(x: 50, y: 100, width: 200, height: 100)
        let l = UILabel(frame: label)
        l.text = "Los pueblos de España están cada vez más vacíos, esto no es novedoso para nadie. Cada vez es más frecuente ver como los jóvenes se van, cada vez es más frecuente ver a una población relativamente mayor en los pueblos, cada vez hay menos turismo. HistoriAR es una aplicación que está comprometida con la repoblación de la España Vaciada.\n\n"
        + "HistoriAR es una aplicación que utiliza Realidad Aumentada para mostrar información y cultura que existe en esos pueblos. De esta forma promovemos el tursmo en estos lugares.\n\n"
        + "En el menú, pulsa el botón del menú inicial '¿Dónde ir?' y te mostraremos una lista de los lugares que puedes visitar, con algunas opciones, para que te pique un poco la curiosidad.\n\n"
        + "¡Ayúdanos a revivir la España Vaciada!"
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.frame.size.width = screenWidth - 60
        l.frame.origin = CGPoint(x: 30, y: screenHeight/3.5 + 10)
        l.textColor = UIColor(hex:0x56C271)
        l.textAlignment = .center
        l.sizeToFit()
        return l
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(logoTitle)
        self.view.addSubview(logoSubtitle)
        self.view.addSubview(instructionsText)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoTitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 750 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 60)
        logoSubtitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 675 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 21)
        
    }
}

