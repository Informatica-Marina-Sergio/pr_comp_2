import UIKit

class WaveView: UIView {
    
    private let firstLayer = CAShapeLayer()
    private let secondLayer = CAShapeLayer()
    
    private var waveColor: UIColor = .clear
    //private var secondColor: UIColor = .clear
    
    private let t: CGFloat = .pi * 2
    private var offset: CGFloat = 0.0
    
    private let width = screenWidth
    
    private var start = false
    
    var firstWaveHeight: CGFloat = 0.0
    var secondWaveHeight: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension WaveView {
    
    private func setUpViews() {
        
        bounds  = CGRect(
            x: 0.0,
            y: 0.0,
            width: 5,
            height: 1
        )
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        
        firstWaveHeight = 25.0
        secondWaveHeight = 100.0
        
        waveColor = UIColor(hex:0x56C271)
        //secondColor = UIColor(hex:0x56C271)
        
        createFirstLayer()
        createSecondLayer()
        
    }
    
    private func createFirstLayer() {
        firstLayer.frame = bounds
        firstLayer.anchorPoint = .zero
        firstLayer.fillColor = waveColor.cgColor
        layer.addSublayer(firstLayer)
    }
    
    private func createSecondLayer() {
        secondLayer.frame = bounds
        secondLayer.anchorPoint = .zero
        secondLayer.fillColor = waveColor.cgColor
        layer.addSublayer(secondLayer)
    }
    
    func setUpProgress() {
        
        firstLayer.setValue(600, forKeyPath: "position.y")
        secondLayer.setValue(590, forKeyPath: "position.y")
        
        if !start {
            DispatchQueue.main.async {
                self.startAnim()
            }
        }
        
    }
    
    private func startAnim() {
        start = true
        waveViewAnim()
    }
    
    private func waveViewAnim() {
        let w = bounds.size.width
        let h = bounds.size.height
        
        let bezier = UIBezierPath()
        let path = CGMutablePath()
        
        let firstStartOffsetY = firstWaveHeight * CGFloat(sinf(Float(offset * t / w)))
        var firstOriginOffsetY: CGFloat = 0.0
        
        path.move(to: CGPoint(
            x: 0.0, y: firstStartOffsetY),
                  transform: .identity
        )
        bezier.move(to: CGPoint(x: 0.0, y: firstStartOffsetY))
        
        for i in stride(from: -200, to: w * 2000, by: 1) {
            firstOriginOffsetY = firstWaveHeight * CGFloat(sinf(Float(t / w * i + offset * t / w)))
            bezier.addLine(to: CGPoint(x: i * 0.7 + 95, y: firstOriginOffsetY))
        }
        
        bezier.addLine(to: CGPoint(x: w * 1000, y: firstOriginOffsetY))
        bezier.addLine(to: CGPoint(x: w * 1000, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: firstStartOffsetY))
        bezier.close()
        
        firstLayer.fillColor = waveColor.cgColor
        firstLayer.path = bezier.cgPath
        
        let secondStartOffsetY = secondWaveHeight * CGFloat(sinf(Float(offset * t / w)))
        var secondOriginOffsetY: CGFloat = 0.0
        
        bezier.move(to: CGPoint(x: 0.0, y: secondStartOffsetY))
        
        for i in stride(from: 0.0, to: w * 1000, by: 1) {
            secondOriginOffsetY = secondWaveHeight * CGFloat(cosf(Float(t / w * i + offset * t / w)))
            bezier.addLine(to: CGPoint(x: i * 2.3, y: secondOriginOffsetY))
        }
        
        bezier.addLine(to: CGPoint(x: w * 1000, y: secondOriginOffsetY))
        bezier.addLine(to: CGPoint(x: w * 1000, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: h))
        bezier.addLine(to: CGPoint(x: 0.0, y: secondStartOffsetY))
        bezier.close()
        
        secondLayer.fillColor = waveColor.cgColor
        secondLayer.path = bezier.cgPath
        
        
        
    }
    
}
