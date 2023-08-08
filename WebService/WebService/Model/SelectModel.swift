//
//  SelectModel.swift
//  WebService
//
//  Created by Sagar Ajudiya on 04/08/23.
//

import Foundation

class SelectModel {
    
    var isSelect: Bool = false
    var title: String
    var items: [SelectModel] = []
    
    init(title: String, items: [SelectModel] = []) {
        self.title = title
        self.items = items
    }
    
    static let list: [SelectModel] = [.init(title: "Header 1", items: [.init(title: "Row 1"), .init(title: "Row 2"), .init(title: "Row 3")]),
                                      .init(title: "Header 2", items: [.init(title: "Row 1"), .init(title: "Row 2"), .init(title: "Row 3")]),
                                      .init(title: "Header 3", items: [.init(title: "Row 1"), .init(title: "Row 2"), .init(title: "Row 3")])]
    
}
