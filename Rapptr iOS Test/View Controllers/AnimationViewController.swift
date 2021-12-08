//
//  AnimationViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class AnimationViewController: UIViewController {
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var btnFade: UIButton!
    
    private var isShowing: Bool = true
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
     *
     * 3) User should be able to drag the logo around the screen with his/her fingers
     *
     * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation 
     *    section in Swfit to show off your skills. Anything your heart desires!
     *
     */
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animation"
        setupUI()
    }
    
    func setupUI() {
        self.navigationController?.navigationBar.topItem?.title = "";
    }
    
    func changeAlpha() {
        self.btnFade.isEnabled = false
        UIView.animate(withDuration: 1.0) {
            self.imgLogo.alpha = self.isShowing ? 0.0 : 1.0
        } completion: { result in
            self.isShowing = !self.isShowing
            self.btnFade.setTitle(self.isShowing ? "FADE OUT" : "FADE IN", for: .normal)
            self.btnFade.isEnabled = true
        }

    }
    
    @IBAction func didPressFade(_ sender: Any) {
        self.changeAlpha()
    }
}
