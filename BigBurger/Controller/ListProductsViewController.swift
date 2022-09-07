//
//  ListProductsViewController.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import UIKit

class ListProductsViewController: UIViewController {
    var catalogData : Catalogdata?
    @IBOutlet weak var tableview : UITableView!
    @IBOutlet weak var mOrderButton : UIButton!
    
    convenience init(catalogData: Catalogdata?) {
        self.init()
        self.catalogData = catalogData
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        catalogData?.getAllProduct{
            error in
            
            guard error == nil else
            {
                print("show modal error")
                return
                
            }
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
            
        }
    }
    
    // This function will init tableView config
    func initTableView() {
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.register(ProductItemTableViewCell.nib(),
                                forCellReuseIdentifier: ProductItemTableViewCell.nibName)
        
        self.tableview.reloadData()
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
extension ListProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalogData?.getCountList() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.catalogData?.getItemsByIndex(index: indexPath.row),
              let mCell = tableView.dequeueReusableCell(withIdentifier: ProductItemTableViewCell.nibName,
                                                        for: indexPath) as? ProductItemTableViewCell else {
            return UITableViewCell()
        }
        mCell.delegate = self
        mCell.index = indexPath.row
        mCell.initView(model: model)
        return mCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
extension ListProductsViewController: ProductItemTableViewCellDelegate {
    func didclickItem(index: Int) {
        
    }
    
    
}
