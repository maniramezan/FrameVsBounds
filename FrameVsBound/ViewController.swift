//
//  ViewController.swift
//  FrameVsBound
//
//  Created by Mani Ramezan on 8/3/17.
//  Copyright © 2017 Manman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: Sliders
    @IBOutlet weak var frameXSlider: UISlider!
    @IBOutlet weak var frameYSlider: UISlider!
    @IBOutlet weak var frameWidthSlider: UISlider!
    @IBOutlet weak var frameHeightSlider: UISlider!
    @IBOutlet weak var boundsXSlider: UISlider!
    @IBOutlet weak var boundsYSlider: UISlider!
    @IBOutlet weak var boundsWidthSlider: UISlider!
    @IBOutlet weak var boundsHeightSlider: UISlider!
    @IBOutlet weak var centerXSlider: UISlider!
    @IBOutlet weak var centerYSlider: UISlider!
    @IBOutlet weak var rotationSlider: UISlider!
    
    // MARK: Labels
    @IBOutlet weak var frameXLabel: UILabel!
    @IBOutlet weak var frameYLabel: UILabel!
    @IBOutlet weak var frameWidthLabel: UILabel!
    @IBOutlet weak var frameHeightLabel: UILabel!
    @IBOutlet weak var boundsXLabel: UILabel!
    @IBOutlet weak var boundsYLabel: UILabel!
    @IBOutlet weak var boundsWidthLabel: UILabel!
    @IBOutlet weak var boundsHeightLabel: UILabel!
    @IBOutlet weak var centerXLabel: UILabel!
    @IBOutlet weak var centerYLabel: UILabel!
    @IBOutlet weak var rotationLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        containerView.layer.borderColor = UIColor.green.cgColor
        containerView.layer.borderWidth = 1
        
        updateLabels()
    }
    
    // MARK: Sldier handlers
    @IBAction func frameXSliderChanged(sender: AnyObject) {
        containerView.frame.origin.x = CGFloat(frameXSlider.value)
        updateLabels()
    }
    @IBAction func frameYSliderChanged(sender: AnyObject) {
        containerView.frame.origin.y = CGFloat(frameYSlider.value)
        updateLabels()
    }
    @IBAction func frameWidthSliderChanged(sender: AnyObject) {
        containerView.frame.size.width = CGFloat(frameWidthSlider.value)
        updateLabels()
    }
    @IBAction func frameHeightSliderChanged(sender: AnyObject) {
        containerView.frame.size.height = CGFloat(frameHeightSlider.value)
        updateLabels()
    }
    @IBAction func boundsXSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateLabels()
    }
    @IBAction func boundsYSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateLabels()
    }
    @IBAction func boundsWidthSliderChanged(sender: AnyObject) {
        containerView.bounds.size.width = CGFloat(boundsWidthSlider.value)
        updateLabels()
    }
    @IBAction func boundsHeightSliderChanged(sender: AnyObject) {
        containerView.bounds.size.height = CGFloat(boundsHeightSlider.value)
        updateLabels()
    }
    @IBAction func centerXSliderChanged(sender: AnyObject) {
        containerView.center.x = CGFloat(centerXSlider.value)
        updateLabels()
    }
    @IBAction func centerYSliderChanged(sender: AnyObject) {
        containerView.center.y = CGFloat(centerYSlider.value)
        updateLabels()
    }
    var lastRotationAngel = 0
    @IBAction func rotationSliderChanged(sender: AnyObject) {
        let currentDegree = Int(rotationSlider.value)
        containerView.rotate(angel: currentDegree - lastRotationAngel)
        lastRotationAngel = currentDegree
        updateLabels()
    }
    
    private func updateLabels() {
        
        frameXLabel.text = "frame x = \(Int(containerView.frame.origin.x))"
        frameYLabel.text = "frame y = \(Int(containerView.frame.origin.y))"
        frameWidthLabel.text = "frame width = \(Int(containerView.frame.width))"
        frameHeightLabel.text = "frame height = \(Int(containerView.frame.height))"
        boundsXLabel.text = "bounds x = \(Int(containerView.bounds.origin.x))"
        boundsYLabel.text = "bounds y = \(Int(containerView.bounds.origin.y))"
        boundsWidthLabel.text = "bounds width = \(Int(containerView.bounds.width))"
        boundsHeightLabel.text = "bounds height = \(Int(containerView.bounds.height))"
        centerXLabel.text = "center x = \(Int(containerView.center.x))"
        centerYLabel.text = "center y = \(Int(containerView.center.y))"
        rotationLabel.text = "rotation = \(Int(rotationSlider.value))"
        
    }
}

extension UIView {
    func rotate(angel: Int) {
        let radians = CGFloat(angel) / 180 * CGFloat.pi
        transform = transform.rotated(by: radians)
    }
}
