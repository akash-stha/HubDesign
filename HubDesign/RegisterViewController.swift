//
//  RegisterViewController.swift
//  HubDesign
//
//  Created by Newarpunk on 5/28/21.
//  Copyright © 2021 Akash Stha. All rights reserved.
//

import UIKit
import IBAnimatable


class RegisterViewController: UIViewController {
    
    var isChecked: Bool = false {
        didSet {
            if isChecked {
                checkBoxImg.setImage(UIImage(named: "checkbox"), for: .normal)
                checkBoxImg.tintColor = .white
            } else {
                checkBoxImg.setImage(UIImage(named: "unChecked"), for: .normal)
                checkBoxImg.tintColor = .white
            }
        }
    }
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var checkBoxImg: AnimatableButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkBoxImg.tintColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        loginBtn.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    @objc func loginTapped() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func termsCheckBox(_ sender: AnimatableButton) {
        isChecked = !isChecked
        if isChecked {
            let alert = UIAlertController.init(title: "", message: "Agreed to the terms and conditions.", preferredStyle: .alert)
            let okAlert = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
            alert.addAction(okAlert)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
