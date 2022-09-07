//
//  ProductItemTableViewCell.swift
//  BigBurger
//
//  Created by walid on 7/9/2022.
//

import UIKit
protocol ProductItemTableViewCellDelegate : AnyObject {
    func didclickItem(index : Int)
}

class ProductItemTableViewCell: UITableViewCell {
    static let nibName: String = "ProductItemTableViewCell"
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var mAddButton: UIButton!
    
    var index: Int = -1
    weak var delegate: ProductItemTableViewCellDelegate?
    var model: Catalog?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func initView(model : Catalog){
        self.model = model
        self.title.text = model.title
        self.desc.text = model.description
        let price = Float(model.price / Float(1000))
        self.price.text = "\(price) €"
        if let url = URL(string: model.thumbnail){
            self.imgView.load(url: url)
        }
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func click(_ sender : Any){
        self.delegate?.didclickItem(index: index)
    }
    
    /*
     get Nib of Cell
     */
    static func nib() -> UINib {
        return UINib(nibName: ProductItemTableViewCell.nibName, bundle: nil)
    }
}
