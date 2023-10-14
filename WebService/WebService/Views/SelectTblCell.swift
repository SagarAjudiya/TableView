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

protocol StepperDelegate: AnyObject {
    func stepperClicked(_ value: Double, _ indexPath: IndexPath)
}

class SelectTblCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblStepper: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    // MARK: - Variables
    weak var delegate: RowButtonProtocol?
    weak var stepperDelegate: StepperDelegate?
    var indexPath: IndexPath?
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configcell(data: SelectModel) {
        btnSelect.isSelected = data.isSelect
        lblTitle.text = data.title
        lblStepper.text = "\(Int(data.count))"
        stepper.value = data.count
    }
    
    // MARK: - Actions
    @IBAction func btnClicked(_ sender: UIButton) {
        delegate?.rowButtonClicked(indexPath ?? IndexPath())
    }
    
    @IBAction func stepperClicked(_ sender: UIStepper) {
        lblStepper.text = String(Int(sender.value))
        print("Action", String(Int(sender.value)))
        stepperDelegate?.stepperClicked(sender.value, indexPath ?? IndexPath())
    }
    
}
