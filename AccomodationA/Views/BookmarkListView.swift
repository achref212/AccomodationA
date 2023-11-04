//
//  SearchAndFilterBar.swift
//  AccomodationA
//
//  Created by chaabani achref on 4/11/2023.
//

import SwiftUI

struct BookmarkView: View {
    var bookmarkedImageInfoList: [ImageInfo]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(bookmarkedImageInfoList, id: \.self) { info in
                    VStack {
                        Image(info.imageName)
                            .resizable()
                            .frame(width: 150, height: 100)
                            .cornerRadius(10)

                        Text(info.title)
                            .font(.headline)
                            .padding(.top, 5)

                        Text(info.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        Text(info.price)
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Bookmarks")
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView(bookmarkedImageInfoList: [])
    }
}
