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
