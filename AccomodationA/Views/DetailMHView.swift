//
//  DetailView.swift
//  AccomodationA
//
//  Created by chaabani achref on 4/11/2023.
//

import SwiftUI
struct HotelInfo: Identifiable {
    var id = UUID()
    var name: String
    var location: String
    var imageName: String
    var galleryImages: [String]
    var description: String
}
struct DetailMHView: View {
    var hotelInfo: HotelInfo // Vous devrez définir la structure HotelInfo avec les détails nécessaires

        var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    // Image en haut de la page
                    Image("home1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    

                    VStack(alignment: .leading, spacing: 16) {
                        // Nom de l'hôtel
                        Text(hotelInfo.name)
                            .font(.title)
                            .padding(.top, 16)

                        // Location de l'hôtel
                        Text(hotelInfo.location)
                            .foregroundColor(.gray)
                            .padding(.bottom, 16)

                        // Galerie d'images avec bouton "View All"
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Gallery")
                                .font(.title2)
                                .fontWeight(.bold)

                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(hotelInfo.galleryImages, id: \.self) { imageName in
                                        Image(imageName)
                                            .resizable()
                                            .frame(width: 120, height: 80)
                                            .cornerRadius(8)
                                    }
                                }
                            }
                            .padding(.bottom, 16)

                            HStack {
                                Spacer()
                                Button("View All") {
                                    // Action à effectuer lors du clic sur "View All"
                                }
                                .foregroundColor(Color(#colorLiteral(red: 0.09411764706, green: 0.431372549, blue: 0.9333333333, alpha: 1))) // Couleur bleue
                            }
                        }
                        .padding(.horizontal, 16)

                        // Détails avec icônes
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Details")
                                .font(.title2)
                                .fontWeight(.bold)

                            HStack {
                                Image(systemName: "building")
                                Text("Hotels")
                            }

                            HStack {
                                Image(systemName: "bed.double")
                                Text("4 Bedrooms")
                            }

                            HStack {
                                Image(systemName: "arrow.right.circle")
                                Text("Size: 300 sq ft")
                            }

                            // Description de l'hôtel
                            Text(hotelInfo.description)
                                .padding(.vertical, 16)

                            HStack {
                                Spacer()
                                Button("Book Now") {
                                    // Action à effectuer lors du clic sur "Book Now"
                                }
                                .padding()
                                .background(Color(#colorLiteral(red: 0.09411764706, green: 0.431372549, blue: 0.9333333333, alpha: 1))) // Couleur bleue
                                .foregroundColor(.white)
                                .cornerRadius(8)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.horizontal, 16)
                    .padding(.top, -32)
                }
            }
            .navigationTitle("Hotel Detail")
        }
    }

    struct HotelDetailView_Previews: PreviewProvider {
        static var previews: some View {
            // Utilisez un exemple d'hôtel pour les aperçus
            DetailMHView(hotelInfo: HotelInfo(
                name: "Hotel Name",
                location: "Paris, France",
                imageName: "hotel_image",
                galleryImages: ["home1", "home2", "home3"],
                description: "Description de l'hôtel"
            ))
        }
    }
