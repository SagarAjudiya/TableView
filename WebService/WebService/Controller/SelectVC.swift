//
//  SelectVC.swift
//  WebService
//
//  Created by Sagar Ajudiya on 04/08/23.
//

import UIKit

class SelectVC: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tblSelect: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - Setup Views
    private func setUpViews() {
        tblSelect.delegate = self
        tblSelect.dataSource = self
        tblSelect.allowsSelection = false
        tblSelect.estimatedRowHeight = UITableView.automaticDimension
        tblSelect.register(UINib(nibName: "SelectTblCell", bundle: nil), forCellReuseIdentifier: "SelectTblCell")
        tblSelect.register(UINib(nibName: "SelectTblHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "SelectTblHeader")
    }

}

// MARK: - Extension For TableView
extension SelectVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        SelectModel.list.count
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        SelectModel.list[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectTblCell", for: indexPath) as? SelectTblCell else { return UITableViewCell() }
        cell.delegate = self
        cell.stepperDelegate = self
        cell.indexPath = indexPath
        cell.configcell(data: SelectModel.list[indexPath.section].items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SelectTblHeader") as? SelectTblHeader else {
          fatalError("Unsupported SelectTblHeader")
        }
        header.configTitle(data: SelectModel.list[section])
        header.section = section
        header.delegate = self
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        48
    }
    
}

extension SelectVC: RowButtonProtocol {
    
    func rowButtonClicked(_ indexPath: IndexPath) {
//        SelectModel.list[indexPath.section].items[indexPath.row].isSelect.toggle()
//        SelectModel.list[indexPath.section].isSelect = SelectModel.list[indexPath.section].items.filter({$0.isSelect == true}).count != 0
//        tblSelect.reloadRows(at: [indexPath], with: .fade)
//        tblSelect.reloadSections(IndexSet(integer: indexPath.section), with: .fade)
    }

}

extension SelectVC: HeaderButtonProtocol {
    
    func headerButtonClicked(_ section: Int) {
//        SelectModel.list[section].isSelect.toggle()
//        _ = SelectModel.list[section].items.compactMap({$0.isSelect = SelectModel.list[section].isSelect})
//        tblSelect.reloadSections(IndexSet(integer: section), with: .fade)
    }
    
}

extension SelectVC: StepperDelegate {
    
    func stepperClicked(_ value: Double, _ indexPath: IndexPath) {
        print(indexPath)
        
        SelectModel.list[indexPath.section].items[indexPath.row].count = value
        SelectModel.list[indexPath.section].items[indexPath.row].isSelect = SelectModel.list[indexPath.section].items[indexPath.row].count > 0
        SelectModel.list[indexPath.section].isSelect = SelectModel.list[indexPath.section].items.filter({$0.isSelect == true}).count != 0
        
        tblSelect.reloadRows(at: [indexPath], with: .fade)
        tblSelect.reloadSections(IndexSet(integer: indexPath.section), with: .fade)
    }
    
}
