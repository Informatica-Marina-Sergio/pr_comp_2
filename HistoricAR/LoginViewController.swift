import UIKit
import SwiftUI

let screenWidth = UIScreen.main .bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height


struct WaveShape: View {
    @State private var change = false
    var body: some View {
        ZStack(content: {
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(
                 content: {
                     ZStack(
                        alignment: .top,
                        content: {
                            Wave(yOffset: change ? 0.6 : -0.6)
                                 .fill(Color.green)
                                 .opacity(0.5)
                                 .frame(height: 190)
                                 .shadow(radius: 4)
                                 .animation(Animation.easeInOut(duration: 3).repeatForever(autoreverses: true))
                             Wave()
                                  .fill(Color.green)
                                  .opacity(0.5)
                                  .frame(height: 170)
                                  .shadow(radius: 4)
                            Wave(yOffset: 0.25)
                                  .fill(Color.green)
                                  .opacity(0.5)
                                  .frame(height: 150)
                                  .shadow(radius: 4)
                                  .padding(.horizontal, -40)
                     })
                     
                 })
                 .edgesIgnoringSafeArea(.top)
        }).foregroundColor(Color.green)
       
    }
}

class LoginViewController: UIViewController {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("¡Empezar!", for: .normal)
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
    
    let waveView = WaveView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(waveView)
                
                waveView.setUpProgress()
                
                NSLayoutConstraint.activate([
                    waveView.widthAnchor.constraint(equalToConstant: screenWidth + 10),
                    waveView.heightAnchor.constraint(equalToConstant: screenHeight + 10),
                    waveView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    waveView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
                ])
        self.view.addSubview(logoTitle)
        self.view.addSubview(logoSubtitle)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x: 30,
            y: view.frame.size.height - 100 - view.safeAreaInsets.bottom,
            width: view.frame.size.width - 60,
            height: 55)
        logoTitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 575 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 60)
        logoSubtitle.frame = CGRect(
            x: 0,
            y: view.frame.size.height - 500 - view.safeAreaInsets.bottom,
            width: view.frame.size.width,
            height: 21)
    }
    
    @IBAction private func didTapButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "arViewController") as! ARViewController
        present(vc, animated: true)
    }
}
