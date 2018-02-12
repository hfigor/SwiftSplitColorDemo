//
//  Color_VC.swift
//  SwiftSplitColorDemo
//
//  Created by Frank Cipolla on 2/6/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class Color_VC: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var hsbLabel: UILabel!
    @IBOutlet weak var rqbLabel: UILabel!
    @IBOutlet weak var hexLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: Instance Methods
    
    func displayColor(color:UIColor) {
        view.backgroundColor = color // set background color
        
        // setup to get colors. You must use an initialized value of CGFloat
        var red:CGFloat = 0.0, green:CGFloat = 0.0, blue:CGFloat = 0.0
        var hue:CGFloat = 0.0, sat:CGFloat = 0.0, bright:CGFloat = 0.0
        var alpha:CGFloat = 0.0
        
        // Format Strings
        let hueFormat = "H:%5.2f S:%5.2f B:%5.2f"
        let rgbFormat = "R:%0.2f G:%0.2f B:%0.2f"
        let hexFormat = "Hex: %02X%02X%02X"
      
    // Get hue, saturation, brightness, and alpha for the color then print it.
    // NOTE: We are using CGFloat pointers (Swift referrs to them as unsafe)
    // as passthrough parameters (book says we use & to get rid of them quickly - wrong
        
        if color.getHue(&hue, saturation: &sat, brightness: &bright, alpha: &alpha) {
            hsbLabel.text = String(format: hueFormat,
            Double(hue), Double(sat), Double(bright))
        }
        
        // Get red, green, blue, and alphathen print in decimal and hex.
        
        if color.getRed(&red,
        green: &green,
        blue: &blue,
        alpha: &alpha)
        {
            rqbLabel.text = String(format: rgbFormat,
            Double(red), Double(green), Double(blue))
            
            // Make a String of Hex digits for the color
            red = red * 255
            green = green * 255
            blue = blue * 255
            hexLabel.text = String(format: hexFormat, Int(red), Int(green), Int(blue))
        }
    
   }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
