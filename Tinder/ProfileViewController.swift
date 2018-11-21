//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Avishek Thapa Magar on 11/21/18.
//  Copyright © 2018 Avishek Thapa Magar. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    var newImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        cardImage.image = newImage
    }

    @IBAction func onTapDone(_ sender: UITapGestureRecognizer) {
         self.dismiss(animated: true)
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
