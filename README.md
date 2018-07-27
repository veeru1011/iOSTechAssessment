# iOSTechAssessment
Technology Assessment

**What am I building?**

The final result of this task is to have an ViewConroller for displaying Item List in a tableView and DeatailViewController which display the simple discription of item after tapping of tableview cell.

**In this project:**

  **Structural Design Pattern**
   - MVVM - Model View ViewModel use for Better UI design


  **Models:**
  - From API data four type of datamodel created those are ResultModel, Item, MediaItem, MetaDataItem 
  
  
  **View /View Controllers:**
  - ViewController - A view controller that create ItemListDataSource and implement it’s data source 
  - DetailViewController - A view controller that showing basing information of item 
  - ItemViewCell class for custom UITableViewCell
  
  - ItemListDataSource - A subclass of GenericDataSource that consume UITableViewDataSource protocal for tableview   dataSource
  
   **ViewModel:**
   - From API data four type of datamodel cretaed those are ResultModel, Item, MediaItem, MetaDataItem
  
   **API:**
   - APIClient - This is a singlton class use for network call and data parsing
  
   
   
### Test Cases: ###

   **iOSAssigmentTests:**
   - testAPICallUsingAPIClient() - this function use to test data validation which coming from API call
   
   
   **iOSAssigmentUITests:** 
   
   - testPerformanceApp() - this function use to test app launching performace.
   - testTableInteraction() - this function use to tableview scrolling as well as open detail page and return to mail list page 
   
   
### Instructions: ###
  - Fork the project
  - Clone the forked project to you'r machine
  - open it using latest Xcode, Build and run
