import SwiftUI
struct ImageInfo: Identifiable, Hashable {
    var id = UUID()
    var imageName: String
    var title: String
    var location: String
    var price: String
    var racing: String
    var isBookmarked: Bool = false
}
struct ContentView: View {
    var imageNames = ["home1", "home2", "home3"]

    @State private var imageInfoList: [ImageInfo] = [
        ImageInfo(imageName: "home1", title: "home desc", location: "Paris, France", price: "$299 / day", racing: "5.0"),
        ImageInfo(imageName: "home2", title: "home2 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
        ImageInfo(imageName: "home3", title: "home3 desc", location: "Paris, France", price: "$299/ day", racing: "5.0"),
    ]

    @State private var selectedCategory: String = "Recommended"

    var categories = ["Recommended", "Popular", "Trending"]

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Image("your_logo_image")
                        .resizable()
                        .frame(width: 100, height: 100) // Ajustez la taille selon vos besoins
                    
                    Text("Hello, User!")
                        .font(.title)
                        .padding()
                }

                HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading, 10)

                    TextField("Rechercher...", text: .constant(""))
                        .padding(.vertical, 10)
                        .padding(.trailing, 10)
                }
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(imageNames, id: \.self) { imageName in
                            VStack {
                                Image(imageName)
                                    .resizable()
                                    .frame(width: 150, height: 100)
                                    .cornerRadius(10)

                                if let info = imageInfoList.first(where: { $0.imageName == imageName }) {
                                    Text(info.title)
                                        .padding(.vertical, 5)
                                    Text(info.location)
                                        .padding(.vertical, 5)
                                    Text(info.price)
                                        .padding(.vertical, 5)
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                }

                ScrollView(.vertical, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(selectedCategory == category ? Color.blue : Color.clear)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(selectedCategory == category ? Color.clear : Color.blue, lineWidth: 1)
                                        )
                                )
                                .foregroundColor(selectedCategory == category ? .white : .blue)
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                    .padding()

                    ForEach(imageInfoList, id: \.self) { info in
                        if selectedCategory == "Recommended" || selectedCategory == info.title {
                            VStack {
                                Image(info.imageName)
                                    .resizable()
                                    .frame(width: 200, height: 150)
                                    .cornerRadius(10)

                                Text(info.title)
                                    .font(.title)
                                    .padding()

                                Text(info.location)
                                    .padding()

                                Text(info.price)
                                    .padding()

                                HStack {
                                    Image(systemName: "bookmark")
                                        .padding()

                                    // Ajoutez votre système de notation ici (rating)
                                    Text("Rating: \(info.racing)")
                                        .padding()
                                }
                            }
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
