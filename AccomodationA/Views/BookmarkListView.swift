import SwiftUI

struct ImageInfoo: Identifiable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var racing: String
}

struct BookmarkView: View {
    var imageNames = ["home1", "home2", "home3"]
    
    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "home1", title: "home desc", location: "Paris, France", price: "$299 / day", racing: "5.0"),
        ImageInfo(imageName: "home2", title: "home2 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
        ImageInfo(imageName: "home3", title: "home3 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
    ]
    
    @State private var isGridView: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $isGridView) {
                    Image(systemName: "rectangle.grid.2x2.fill").tag(true)
                    Image(systemName: "list.bullet").tag(false)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if isGridView {
                    gridView
                } else {
                    listView
                }
            }
            .navigationTitle("My Bookmarks")
        }
    }
    
    var gridView: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 40), count: 2), spacing: 16) {
                ForEach(imageInfoList) { imageInfo in
                    NavigationLink(destination: ImageDetailView(imageInfo: imageInfo)) {
                        BookmarkItemView(imageInfo: imageInfo)
                        
                    }
                }
            }
            .padding()
        }
    }
    
    
    var listView: some View {
        List(imageInfoList) { imageInfo in
            NavigationLink(destination: ImageDetailView(imageInfo: imageInfo)) {
                BookmarkItemView(imageInfo: imageInfo)
            }
            .listRowInsets(EdgeInsets()) // Supprime les marges par défaut et centre la liste
        }
        .padding()
        .navigationBarHidden(true) // Masque la barre de navigation
    }
    
    struct BookmarkItemView: View {
        var imageInfo: ImageInfo
        
        var body: some View {
            VStack {
                Image(imageInfo.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150,height: 100)
                    .cornerRadius(8)
                
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
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
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
}
