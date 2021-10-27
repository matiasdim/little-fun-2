//
//  ViewController.swift
//  DrawPolygonApp
//
//  Created by Matías  Gil Echavarría on 26/10/21.
//

import UIKit

/// Protocol to decouple The viewController and keep single responsibility, so it is freed from the responsability to draw.
/// Any UIView conforming this protocol will be able to draw dots and lines connecting its dots
protocol Canvas: UIView {
    func draw(lineFrom start: CGPoint, to end: CGPoint)
    func draw(dot: CGPoint)
    func clean()
}

class ViewController: UIViewController {

    @IBOutlet weak var canvasView: CanvasView!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    private var points = [CGPoint]()
    private var tapGestureRecognizer: UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }

    @IBAction func resetPressed(_ sender: Any) {
        points.removeAll()
        canvasView.clean()
        start()
    }
    @IBAction func completePressed(_ sender: Any) {
        guard let last = points.last, let first = points.first else { return }
        canvasView.draw(lineFrom: last, to: first)
        end()
    }
    
    @objc func addPoint(tap: UITapGestureRecognizer) {
        /// Add point
        let tapPoint = tap.location(in: canvasView)
        points.append(tapPoint)
        canvasView.draw(dot: tapPoint)
        let count = points.count
        if count > 1 {
            canvasView.draw(lineFrom: points[count-2], to: points[count-1])
        }
        completeButton.isEnabled = (count > 2)
    }

    private func configure() {
        completeButton.isEnabled = false
        completeButton.setTitleColor(.systemBlue, for: .normal)
        completeButton.setTitleColor(.systemGray, for: .disabled)
        
        start()
    }
    
    private func start() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(addPoint(tap:)))
        tapGestureRecognizer.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func end() {
        view.removeGestureRecognizer(tapGestureRecognizer)
    }
}


/// The canvas
/// Custom UIView that implements Canvas protocol
class CanvasView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .systemGray2
    }
}

extension CanvasView: Canvas {
    func draw(lineFrom start: CGPoint, to end: CGPoint) {
        let lineLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        lineLayer.path = linePath.cgPath
        lineLayer.strokeColor = UIColor.systemBlue.cgColor
        lineLayer.lineWidth = 1
        lineLayer.lineJoin = .bevel
        layer.addSublayer(lineLayer)
    }
    
    func draw(dot: CGPoint) {
        let dotLayer = CAShapeLayer()
        let dotRadius:CGFloat = 5
        
        let dotPath = UIBezierPath(ovalIn: CGRect(x: dot.x-(dotRadius/2),
                                                  y: dot.y-(dotRadius/2),
                                                  width: dotRadius,
                                                  height: dotRadius))
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = UIColor.red.cgColor
        
        layer.addSublayer(dotLayer)
    }
    
    func clean() {
        layer.sublayers?.removeAll()
    }
    
}
