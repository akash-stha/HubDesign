//
//  LoginViewController.swift
//  HubDesign
//
//  Created by Newarpunk on 5/28/21.
//  Copyright © 2021 Akash Stha. All rights reserved.
//

import UIKit
import IBAnimatable

class LoginViewController: UIViewController {

    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        registerBtn.addTarget(self, action: #selector(registerTapped), for: .touchDown)
    }
    
    @objc func registerTapped() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func cancelBtn(_ sender: AnimatableButton) {
        self.navigationController?.popViewController(animated: true)
    }

}
