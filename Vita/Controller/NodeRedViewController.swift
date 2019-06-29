//
//  NodeRedViewController.swift
//  Vita
//
//  Created by Nnamdi Ugwuoke on 6/29/19.
//  Copyright © 2019 Vita. All rights reserved.
//

import UIKit
import WebKit

class NodeRedViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString: String = "http://50.23.5.183:30002/ui/#!/0"
        let url:URL = URL(string: urlString)!
        let urlRequest: URLRequest = URLRequest(url: url)
        webview.load(urlRequest)
        // Do any additional setup after loading the view.
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
