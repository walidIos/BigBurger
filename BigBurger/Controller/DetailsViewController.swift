//
//  DetailsViewController.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import UIKit

class DetailsViewController: UIViewController {
    var SomePrice = Float()
    @IBOutlet weak var mSomeLable : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mSomeLable.text = "your order cost \(SomePrice) €"
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
