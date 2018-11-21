//
//  ViewController.swift
//  Tinder
//
//  Created by Avishek Thapa Magar on 11/21/18.
//  Copyright © 2018 Avishek Thapa Magar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardView: UIImageView!
   
    var cardInitialCenter: CGPoint!
    var whereStartedY: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        roundImage()
        cardInitialCenter = cardView.center
    }

    func roundImage() {
        cardView.layer.cornerRadius = 50
        cardView.clipsToBounds = true
    }
    
    @IBAction func onPan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if (sender.state == .began) {
            whereStartedY = sender.location(in: view).y
        }
        else if (sender.state == .changed) {
            if (whereStartedY < 200) {
                //top right
                if (translation.x > 0) {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = min(45, Double(translation.x)/4) * Double.pi / 180
                    cardView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardView.transform = cardView.transform.rotated(by: CGFloat(rotationAmount))
                }
                    //top left
                else {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = max(-45, Double(translation.x)/4) * Double.pi / 180
                    cardView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardView.transform = cardView.transform.rotated(by: CGFloat(rotationAmount))
                }
            } else {
                //bottom right
                if (translation.x > 0) {
                    let translationAmount = min(180, translation.x)
                    let rotationAmount = max(-45, -Double(translation.x)/4) * Double.pi / 180
                    cardView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardView.transform = cardView.transform.rotated(by: CGFloat(rotationAmount))
                }
                    //bottom left
                else {
                    let translationAmount = max(-180, translation.x)
                    let rotationAmount = min(45, -Double(translation.x)/4) * Double.pi / 180
                    cardView.transform = CGAffineTransform(translationX: translationAmount, y: 0)
                    cardView.transform = cardView.transform.rotated(by: CGFloat(rotationAmount))
                }
            }
            
        }
        else if (sender.state == .ended) {
            if (translation.x > 50) {
                UIView.animate(withDuration:0.1, animations: {
                    if (self.whereStartedY < 200) {
                        self.cardView.transform = CGAffineTransform(translationX: 180, y: 0)
                        self.cardView.transform = self.cardView.transform.rotated(by: CGFloat(45))
                    } else {
                        self.cardView.transform = CGAffineTransform(translationX: 180, y: 0)
                        self.cardView.transform = self.cardView.transform.rotated(by: CGFloat(-45))
                    }
                }) { (Bool) in
                    self.cardView.isHidden = true
                }
            }
            else if (translation.x < -50) {
                UIView.animate(withDuration:0.1, animations: {
                    if (self.whereStartedY < 200) {
                        self.cardView.transform = CGAffineTransform(translationX: -180, y: 0)
                        self.cardView.transform = self.cardView.transform.rotated(by: CGFloat(-45))
                    } else {
                        self.cardView.transform = CGAffineTransform(translationX: -180, y: 0)
                        self.cardView.transform = self.cardView.transform.rotated(by: CGFloat(45))
                    }
                }) { (Bool) in
                    self.cardView.isHidden = true
                }
            } else {
                UIView.animate(withDuration:0.1, animations: {
                    // This causes first view to fade in and second view to fade out
                    self.cardView.transform = CGAffineTransform.identity
                })
            }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "ProfileSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ProfileViewController
        destinationVC.newImage = self.cardView.image
        //profileViewController.cardImage = self.cardView.image
    }


}

