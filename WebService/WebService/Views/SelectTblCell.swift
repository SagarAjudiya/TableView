//
//  SelectTblCell.swift
//  WebService
//
//  Created by Sagar Ajudiya on 04/08/23.
//

import UIKit 

protocol RowButtonProtocol: AnyObject {
    func rowButtonClicked(_ indexPath: IndexPath)
}

class SelectTblCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    weak var delegate: RowButtonProtocol?
    var indexPath: IndexPath?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configcell(data: SelectModel) {
        btnSelect.isSelected = data.isSelect
        lblTitle.text = data.title
    }
    
    // MARK: - Actions
    @IBAction func btnClicked(_ sender: UIButton) {
        delegate?.rowButtonClicked(indexPath ?? IndexPath())
    }
    
}
