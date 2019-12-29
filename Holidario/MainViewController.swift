//
//  ViewController.swift
//  Holidario
//
//  Created by Tadreik Campbell on 12/25/19.
//  Copyright © 2019 Tadreik Campbell. All rights reserved.
//

import UIKit
import ARKit
import RealityKit

class MainViewController: UIViewController {
    
    // MARK: IBOutlets
    
    let defaults = UserDefaults.standard
    let selection = UISelectionFeedbackGenerator()
    
    @IBOutlet var arView: ARView!
    
    // MARK: Variables

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Prevent the screen from being dimmed to avoid interuppting the AR experience.
        UIApplication.shared.isIdleTimerDisabled = true

        // Start the ARSession.
        resetTracking()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the "Enter" scene from the "Holidario" Reality File
        let enterAnchor = try! Holidario.loadEnter()
        
        // Add the enter anchor to the scene
        arView.scene.anchors.append(enterAnchor)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        arView.session.pause()
    }
    
    /// Creates a new AR configuration to run on the session
    func resetTracking() {
        guard let config = arView.session.configuration as? ARWorldTrackingConfiguration,
            ARWorldTrackingConfiguration.supportsFrameSemantics(.personSegmentationWithDepth) else {
                return
        }
        config.planeDetection = [.horizontal]
        config.environmentTexturing = .automatic
        config.isLightEstimationEnabled = true
        config.frameSemantics = .personSegmentationWithDepth
        
        arView.session.run(config, options: [.resetTracking, .removeExistingAnchors])

    }
    
    // MARK: - Error handling
    
    func displayErrorMessage(title: String, message: String) {
        
        // Present an alert informing about the error that has occurred.
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart Session", style: .default) { _ in
            alertController.dismiss(animated: true, completion: nil)
            self.resetTracking()
        }
        alertController.addAction(restartAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override var prefersHomeIndicatorAutoHidden: Bool {
        return false
    }
}
