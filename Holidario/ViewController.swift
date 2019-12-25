//
//  ViewController.swift
//  Holidario
//
//  Created by Tadreik Campbell on 12/25/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Enter" scene from the "Holidario" Reality File
        let enterAnchor = try! Holidario.loadEnter()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(enterAnchor)
    }
}
