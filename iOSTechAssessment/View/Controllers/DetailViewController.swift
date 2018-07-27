//
//  DetailViewController.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var byLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel
    var itemViewModel: ItemCellViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateUI() {
        if let item = itemViewModel?.item {
            self.typeLabel.text = item.type ?? ""
            self.titleLabel.text = item.title ?? ""
            self.byLabel.text = item.byline ?? ""
            self.timeLabel.text = item.publishedDate ?? ""
            
            self.sectionLabel.text = "Section: \(item.section ?? "")"
            self.sourceLabel.text = "Source: \(item.source ?? "")"
            self.abstractLabel.text = "Abstract: \(item.abstract ?? "")"
            self.title = "Detail"
            
            if let urlString = item.url {
                let url = URL(string: urlString)
                let requestObj = URLRequest(url: url! as URL)
                
                webView.load(requestObj)
                webView.navigationDelegate = self
            }
        }
        
        
    }
    
}

//MARK:- WKNavigationDelegate
extension DetailViewController:  WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
}
