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
    var count: Double = 0.0
    var items: [SelectModel] = []
    
    init(title: String, count: Double = 0.0, items: [SelectModel] = []) {
        self.title = title
        self.items = items
        self.count = count
    }
    
    static let list: [SelectModel] = [.init(title: "Header 1", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3")]),
                                      .init(title: "Header 2", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3", count: 0)]),
                                      .init(title: "Header 3", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3", count: 0)]),
                                      .init(title: "Header 4", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3", count: 0)]),
                                      .init(title: "Header 5", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3", count: 0)]),
                                      .init(title: "Header 6", items: [.init(title: "Row 1", count: 0), .init(title: "Row 2", count: 0), .init(title: "Row 3", count: 0)])]
    
}
