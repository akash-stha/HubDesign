//
//  ViewController.swift
//  HubDesign
//
//  Created by Newarpunk on 5/28/21.
//  Copyright © 2021 Akash Stha. All rights reserved.
//

import UIKit
import IBAnimatable

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    var counter = 0
    var timer : Timer?
    
//    var infoArray = [
//        "अब mDabali app प्रयोग गरि सहकारी तथा लघुवित्त संस्थाका ग्राहकहरुले वाणिज्य बैंकहरुमा पैसा पठाउन तथा पाउन सकिने सुविधा",
//        "This app is for mDabali app वाणिज्य बैंकहरुमा पैसा पठाउन तथा पाउन सकिने सुविधा This app is for mDabali app वाणिज्य बैंकहरुमा पैसा पठाउन तथा पाउन सकिने सुविधा",
//        "वाणिज्य बैंकहरुमा पैसा पठाउन तथा पाउन सकिने सुविधा This app is for mDabali app वाणिज्य बैंकहरुमा पैसा पठाउन तथा पाउन सकिने सुविधा This app is for mDabali app"
//    ]
    
    var infoArray = [
        "Now, using the mDabali app, customers of cooperatives and microfinance institutions can send and receive money to and from commercial banks.",
        "This app is for facilitating the sending and receiving of money in commercial banks through the mDabali app.",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(scrollText), userInfo: nil, repeats: true)
    }

    
    @objc func scrollText(){
        if counter < infoArray.count{
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageController.currentPage = counter
            counter += 1
        }else{
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageController.currentPage = counter
            counter = 1
        }
    }

    @IBAction func loginBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
        cell.infoLabel.text = infoArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        counter = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    } 
    
}

