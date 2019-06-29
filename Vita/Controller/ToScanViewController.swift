//
//  ToScanViewController.swift
//  Vita
//
//  Created by Nnamdi Ugwuoke on 6/29/19.
//  Copyright © 2019 Vita. All rights reserved.
//

import UIKit

class ToScanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func scanBTN(_ sender: Any) {
        let detailVC = HomeController()
        navigationController?.pushViewController(detailVC, animated: true)
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
