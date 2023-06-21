//
//  WebViewController.swift
//  Salonga_Demo
//
//  Created by Emmanuel Salonga on 6/21/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    let trailerURLString: String
    
    init(trailerURLString: String) {
        self.trailerURLString = trailerURLString
        super.init(nibName: nil, bundle: nil)
    }
    
    lazy var webView = {
        
        let webView = WKWebView(frame: UIScreen.main.bounds)
        webView.navigationDelegate = self
        return webView
    }()
    
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let trailerURL = URL(string: trailerURLString) {
            let request = URLRequest(url: trailerURL)
            webView.load(request)
        }
    }
    
    

}

extension WebViewController: WKNavigationDelegate {
    
}
