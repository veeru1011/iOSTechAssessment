//
//  ItemListViewModel.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation

class ItemListViewModel: NSObject {
    
    
    let apiManager: APIClient!
    weak var dataSource : GenericDataSource<ItemCellViewModel>?
    var errorMessage: Dynamic<String>?
    var isLoading: Dynamic<Bool>?
    var items: [Item]?

    
    init(apiMgr: APIClient = APIClient.shared(), dataSource : GenericDataSource<ItemCellViewModel>?) {
        self.dataSource = dataSource
        self.apiManager = apiMgr
        self.errorMessage = Dynamic("")
        self.isLoading = Dynamic(true)
    }
    
    func getCellViewModel( at indexPath: IndexPath ) -> ItemCellViewModel? {
        
        let item = self.dataSource?.data.value[indexPath.row]
        return item
    }
    
    func getItemList(_ completion: (() -> Void )? = nil )  {
        
        self.apiManager.getData { (success, result, errorMessage) in
            
            self.isLoading?.value = false
            switch success {
            case true :
                if let result = result {
                    if let items = result.results {
                        self.processFetchedItems(items: items)
                    }
                }
            case false:
                self.errorMessage?.value = errorMessage
                
            }
            completion?()
        }
    }
    
    private func processFetchedItems( items: [Item] ) {
        self.items = items // Cache
        var vms = [ItemCellViewModel]()
        for item in items {
            vms.append( ItemCellViewModel(item: item) )
        }
        self.dataSource?.data.value = vms
    }
}
