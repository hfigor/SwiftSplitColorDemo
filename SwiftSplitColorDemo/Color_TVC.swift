//
//  Color_TVC.swift
//  SwiftSplitColorDemo
//
//  Created by Frank Cipolla on 2/8/18.
//  Copyright © 2018 Frank Cipolla. All rights reserved.
//

import UIKit

class Color_TVC: UITableViewController {
    
    // MARK: Properties
    
    let hueCount:CGFloat = 5.0
    let saturationCount:CGFloat = 10.0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Int(hueCount)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(saturationCount)
    }
    
    // from pg 355
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = CGFloat(indexPath.row)
        let section = CGFloat(indexPath.section)
        let hue = section / hueCount
        let saturation = 1.0 - row / saturationCount
        let color = UIColor(hue: hue,
                            saturation: saturation,
                            brightness: 1.0,
                            alpha: 1.0)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = color
        
        return cell
    }
    
    // pg 356
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        // we have no navigation controller so the controller in the last spot is what we want
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            let detailViewController = controllers[controllers.count - 1] as? Color_VC
            detailViewController?.displayColor(color: (cell?.backgroundColor)!)
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
