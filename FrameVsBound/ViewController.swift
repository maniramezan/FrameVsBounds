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
        updateSliders()
    }
    
    // MARK: Sldier handlers
    @IBAction func frameXSliderChanged(sender: AnyObject) {
        containerView.frame.origin.x = CGFloat(frameXSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func frameYSliderChanged(sender: AnyObject) {
        containerView.frame.origin.y = CGFloat(frameYSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func frameWidthSliderChanged(sender: AnyObject) {
        containerView.frame.size.width = CGFloat(frameWidthSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func frameHeightSliderChanged(sender: AnyObject) {
        containerView.frame.size.height = CGFloat(frameHeightSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func boundsXSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.x = CGFloat(boundsXSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func boundsYSliderChanged(sender: AnyObject) {
        containerView.bounds.origin.y = CGFloat(boundsYSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func boundsWidthSliderChanged(sender: AnyObject) {
        containerView.bounds.size.width = CGFloat(boundsWidthSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func boundsHeightSliderChanged(sender: AnyObject) {
        containerView.bounds.size.height = CGFloat(boundsHeightSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func centerXSliderChanged(sender: AnyObject) {
        containerView.center.x = CGFloat(centerXSlider.value)
        updateLabels()
        updateSliders()
    }
    @IBAction func centerYSliderChanged(sender: AnyObject) {
        containerView.center.y = CGFloat(centerYSlider.value)
        updateLabels()
        updateSliders()
    }
    var lastRotationAngel = 0
    @IBAction func rotationSliderChanged(sender: AnyObject) {
        let currentDegree = Int(rotationSlider.value)
        containerView.rotate(angel: currentDegree - lastRotationAngel)
        lastRotationAngel = currentDegree
        updateLabels()
        updateSliders()
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
    
    private func updateSliders() {
        
        frameXSlider.value = Float(containerView.frame.origin.x)
        frameYSlider.value = Float(containerView.frame.origin.y)
        frameWidthSlider.value = Float(containerView.frame.size.width)
        frameHeightSlider.value = Float(containerView.frame.size.height)
        boundsXSlider.value = Float(containerView.bounds.origin.x)
        boundsYSlider.value = Float(containerView.bounds.origin.y)
        boundsWidthSlider.value = Float(containerView.bounds.size.width)
        boundsHeightSlider.value = Float(containerView.bounds.size.height)
        centerXSlider.value = Float(containerView.center.x)
        centerYSlider.value = Float(containerView.center.y)
        
    }
}

extension UIView {
    func rotate(angel: Int) {
        let radians = CGFloat(angel) / 180 * CGFloat.pi
        transform = transform.rotated(by: radians)
    }
}
