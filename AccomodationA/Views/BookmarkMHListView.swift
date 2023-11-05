import SwiftUI

struct ImageInfos: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var racing: String
}

struct BookmarkView: View {
    @State private var isGridViewSelected = true
    @State private var isListViewSelected = false

    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "home1", title: "home desc", location: "Paris, France", price: "$299 / day", racing: "5.0"),
        ImageInfo(imageName: "home2", title: "home2 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
        ImageInfo(imageName: "home3", title: "home3 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
    ]

    @State private var showingAlert = false
    @State private var selectedBookmark: ImageInfo?

    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $isGridViewSelected) {
                    Image(systemName: "rectangle.grid.2x2.fill")
                        .tag(true)
                        .foregroundColor(isGridViewSelected ? Color.blue : Color.blue)

                    Image(systemName: "list.bullet")
                        .tag(false)
                        .foregroundColor( Color.blue)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                if isGridViewSelected {
                    gridView
                } else {
                    listView
                }
            }
            .navigationTitle("My Bookmarks")
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Remove Bookmark"),
                    message: Text("Are you sure you wanti to remove this bookmark?"),
                    primaryButton: .destructive(Text("Yes")) {
                        if let selectedBookmark = selectedBookmark {
                            removeBookmark(bookmark: selectedBookmark)
                        }
                    },
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
    }

    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 10) {
                ForEach(imageInfoList) { imageInfo in
                    NavigationLink(destination: ImageDetailView(imageInfo: imageInfo)) {
                        BookmarkItemView(imageInfo: imageInfo)
                            .contextMenu {
                                Button(action: {
                                    selectedBookmark = imageInfo
                                    showingAlert = true
                                }) {
                                    Label("Remove Bookmark", systemImage: "bookmark.fill")
                                }
                            }
                    }
                }
            }
            .padding()
        }
    }

    var listView: some View {
        List(imageInfoList) { imageInfo in
            HStack {
                NavigationLink(destination: ImageDetailView(imageInfo: imageInfo)) {
                    BookmarkItemView(imageInfo: imageInfo)
                }
                .listRowInsets(EdgeInsets())

                Button(action: {
                    selectedBookmark = imageInfo
                    showingAlert = true
                }) {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.blue)
                        .imageScale(.large)
                }
                .buttonStyle(BorderlessButtonStyle())
                .padding(.trailing, 20)
            }
        }
        .padding()
        .navigationBarHidden(true)
    }

    func removeBookmark(bookmark: ImageInfo) {
        if let index = imageInfoList.firstIndex(where: { $0.id == bookmark.id }) {
            imageInfoList.remove(at: index)
        }
    }
}

struct BookmarkItemView: View {
    var imageInfo: ImageInfo

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(imageInfo.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 60)
                    .cornerRadius(8)

                Button(action: {
                    // Add your bookmark action here
                }) {
                    Image(systemName: "bookmark.fill")
                        .foregroundColor(.blue)
                }
                .padding(5)
            }

            Text(imageInfo.title)
                .font(.headline)
                .padding(.vertical, 5)

            Text(imageInfo.location)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(imageInfo.price)
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ImageDetailView: View {
    var imageInfo: ImageInfo

    var body: some View {
        VStack {
            Image(imageInfo.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .clipped()

            Text(imageInfo.title)
                .font(.title)
                .padding(.top, 16)

            Text(imageInfo.location)
                .foregroundColor(.gray)
                .padding(.bottom, 16)

            // Add the rest of the details specific to the image here
        }
        .padding()
        .navigationTitle(imageInfo.title)
    }
}



struct BookmarkView_Previews: PreviewProvider {
    static var previews: some View {
        BookmarkView()
    }
}
