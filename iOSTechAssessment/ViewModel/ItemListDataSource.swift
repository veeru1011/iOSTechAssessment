//
//  ItemListDataSource.swift
//  iOSTechAssessment
//
//  Created by VEER TIWARI on 7/27/18.
//  Copyright © 2018 VBT. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<T> : NSObject {
    var data: DynamicValue<[T]> = DynamicValue([])
}

class ItemListDataSource: GenericDataSource<ItemCellViewModel>,  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemViewCell
        
        let itemViewModel = self.data.value[indexPath.row]
        cell.itemViewModel = itemViewModel
        return cell
    }

}
