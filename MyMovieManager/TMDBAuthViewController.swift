//
//  TMDBAuthViewController.swift
//  MyMovieManager
//
//  Created by xengar on 2017-11-25.
//  Copyright © 2017 xengar. All rights reserved.
//

import UIKit

// MARK: - TMDBAuthViewController: UIViewController

class TMDBAuthViewController: UIViewController {

    // MARK: Properties
    
    var urlRequest: URLRequest? = nil
    var requestToken: String? = nil
    var completionHandlerForView: ((_ success: Bool, _ errorString: String?) -> Void)? = nil
    
    // MARK: Outlets
    
    @IBOutlet weak var webView: UIWebView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.delegate = self
        
        navigationItem.title = "TheMovieDB Auth"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAuth))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let urlRequest = urlRequest {
            webView.loadRequest(urlRequest)
        }
    }
    
    // MARK: Cancel Auth Flow
    
    @objc func cancelAuth() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - TMDBAuthViewController: UIWebViewDelegate

extension TMDBAuthViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // If the user click allow to OAuth then, dismiss the view
        //print ("=====")
        //print (webView.request!.url!.absoluteString )
        //print ("=====")
        if webView.request!.url!.absoluteString == "\(TMDBClient.Constants.AuthorizationURL)\(requestToken!)/allow" {
            dismiss(animated: true){
                self.completionHandlerForView!(true, nil)
            }
        }
    }
}
