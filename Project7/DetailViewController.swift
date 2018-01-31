//
//  DetailViewController.swift
//  Project7
//
//  Created by Jamie Auza on 1/30/18.
//  Copyright © 2018 Jamie Auza. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: [String: String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard detailItem != nil else{ return }
        
        webView = WKWebView()
        view = webView
        
        if let body = detailItem["description"]{
            var html = "<html>"
            html += "<head>"
            html += "<metaname=\"viewport\" content=\"width=device-width,intial-scale=1\">"
            html += "<style> body {font-size: 150%; } </style>"
            html += "</head>"
            html += "<body>"
            html += body
            html += "</body>"
            html += "</html>"
            webView.loadHTMLString(html, baseURL: nil)
        }
        // Do any additional setup after loading the view.
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
