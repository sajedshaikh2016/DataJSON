//
//  EmployeeData.swift
//  DataJSON
//
//  Created by Sajed Shaikh on 10/08/24.
//

import Foundation

struct User: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case name
        case job
        case email
    }
    
    var id = UUID()
    var name: String
    var job: String
    var email: String
    
    init(id: UUID = UUID(), name: String, job: String, email: String) {
        self.id = id
        self.name = name
        self.job = job
        self.email = email
    }
}

class ReadJsonData: ObservableObject {
    @Published var users = [User]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("JSON file not found!")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        
        self.users = users!
    }
}
