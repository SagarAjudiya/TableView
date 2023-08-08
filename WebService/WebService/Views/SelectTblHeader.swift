//
//  SelectTblHeader.swift
//  WebService
//
//  Created by Sagar Ajudiya on 04/08/23.
//

import UIKit

protocol HeaderButtonProtocol: AnyObject {
    func headerButtonClicked(_ section: Int)
}

class SelectTblHeader: UITableViewHeaderFooterView {
    
    // MARK: - Outlets
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    weak var delegate: HeaderButtonProtocol?
    var section: Int?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
    }

    func configTitle(data: SelectModel) {
        lblTitle.text = data.title
        btnSelect.isSelected = data.isSelect
    }
    
    // MARK: - Actions
    @IBAction func btnClicked(_ sender: UIButton) {
        delegate?.headerButtonClicked(section ?? 0)
    }
    
}
