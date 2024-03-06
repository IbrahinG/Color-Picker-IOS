//  ViewController.swift
//  ColorMix
//  Created by Ibrahin Gonzalez on 2/8/24.

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var colorView: UIView!
    //Switch
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    
    //Slider
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBAction func reset(_ sender: Any) {
        [redSlider, greenSlider, blueSlider].forEach {$0.value = 1 }
        [redSwitch, greenSwitch, blueSwitch].forEach {$0.isOn = false}
        updateColor()
        updateControls()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        colorView.layer.borderColor = UIColor.black.cgColor
        updateColor()
        updateControls()
    }
    
    @IBAction func switchChanged(_ sender: UISwitch) {updateColor(); updateControls()}
    
    @IBAction func sliderChanged(_ sender: UISlider) { updateColor() }
    
    func updateColor() {
        let red = redSwitch.isOn ? redSlider.value : 0
        let green = greenSwitch.isOn ? greenSlider.value : 0
        let blue = blueSwitch.isOn ? blueSlider.value : 0

        let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
        colorView.backgroundColor = color
    }
    
    func updateControls(){
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
}
