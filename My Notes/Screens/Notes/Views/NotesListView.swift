//
//  NotesListView.swift
//  My Notes
//
//  Created by Ankit Kumar Ojha on 11/03/26.
//

import SwiftUI

struct NotesListView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            .padding()
            
        }
    }
}

#Preview {
    NotesListView()
}
