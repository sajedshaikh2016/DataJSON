//
//  ContentView.swift
//  DataJSON
//
//  Created by Sajed Shaikh on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = ReadJsonData()
    var body: some View {
        VStack {
            List(data.users) { info in
                VStack(alignment: .leading, spacing: nil, content: {
                    HStack(alignment: .center, spacing: nil, content: {
                        Text(info.name)
                            .font(.title)
                        Text(info.job)
                            .font(.body)
                    })
                    Text(info.email)
                        .font(.caption)
                })
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
