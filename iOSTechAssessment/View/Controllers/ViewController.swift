//
//  ViewController.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel
    var itemListViewModel: ItemListViewModel!
    let dataSource = ItemListDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpTableview()
        setUpItemListViewModel()
        itemListViewModel.getItemList()
        
    }
    
    // MARK: Helpers
    func setUpTableview() {
        
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 0.01))
        tableView.dataSource = self.dataSource
        tableView.delegate = self
        tableView.estimatedRowHeight = 100
        tableView.accessibilityIdentifier = "TableViewAccessibilityIdentifier"
        tableView.rowHeight = UITableViewAutomaticDimension

    }
    
    //  Set up ItemListViewModel and  Add All Listioner for viewModel data updated
    func setUpItemListViewModel() {
        
        //initilise FactListViewModel with DataSource
        itemListViewModel = ItemListViewModel(dataSource: dataSource)
        
        // Notifier for datasource fetch data
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    
        // Notifier for Error message
        itemListViewModel.errorMessage?.bindAndFire { [unowned self] in
            if $0.count > 0 {
                self.showAlert($0)
            }
        }
        
        // Notifier for Loading message
        itemListViewModel.isLoading?.bindAndFire { isLoading in
            if !isLoading {
                 DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    //  NavigationBar setup method
    func setUpNavigationBar() {
        navigationItem.title = "NY Times Most Popular"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 22), .foregroundColor:#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)]
        
        
        let leftBarButton: UIBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "toggle.png"), style:.plain, target: self, action: #selector(navButtonTapped))
        
        self.navigationItem.leftBarButtonItem = leftBarButton
        let searchBarButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(navButtonTapped))
        let menuBarButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style:.plain, target: self, action: #selector(navButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [menuBarButton, searchBarButton]

    }
    
    // MARK: - AlertMessage UI
    func showAlert(_ message: String, title: String = "Alert") {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message:
                message, preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @objc func navButtonTapped(sender: Any) {
        print("Navigation Button Tapped")
    }

}

extension ViewController:  UITableViewDelegate {
    
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.itemViewModel = itemListViewModel.getCellViewModel(at: indexPath)
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
}

