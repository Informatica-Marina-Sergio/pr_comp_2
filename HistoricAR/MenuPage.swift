import Foundation
import UIKit

extension UIColor {

    convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )

        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }

}

class MenuPage: UIViewController {
    private let instructionButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Instrucciones", for: .normal)
        button.setTitleColor(UIColor(hex:0x56C271), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    private let listButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("¿Dónde ir?", for: .normal)
        button.setTitleColor(UIColor(hex:0x56C271), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    private let raButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Realidad aumentada", for: .normal)
        button.setTitleColor(UIColor(hex:0x56C271), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()
    private let logoTitle: UILabel = {
        let logoTitle = UILabel()
        logoTitle.textAlignment = .center
        logoTitle.text = "HistoricAR"
        logoTitle.textColor = .white
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
        logoSubtitle.textColor = .white
        logoSubtitle.font = logoSubtitle.font.withSize(16)
        return logoSubtitle
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex:0x56C271)
        self.view.addSubview(logoTitle)
        self.view.addSubview(logoSubtitle)
        self.view.addSubview(instructionButton)
        self.view.addSubview(listButton)
        self.view.addSubview(raButton)
        raButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        instructionButton.addTarget(self, action: #selector(didTapInstructionsButton), for: .touchUpInside)
        listButton.addTarget(self, action: #selector(didTapListButton), for: .touchUpInside)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoTitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 700 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 60)
        logoSubtitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 625 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 21)
        instructionButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 450 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
        listButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 375 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
        raButton.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 300 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
    }
    
    @IBAction private func didTapButton() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @IBAction private func didTapInstructionsButton() {
        let vc = InstructionsPage()
        vc.title = "Instrucciones"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func didTapListButton() {
        let vc = ContentViewController()
        vc.title =  "¿Dónde ir?"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
