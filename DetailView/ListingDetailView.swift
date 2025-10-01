

import SwiftUI


struct ListingDetailView: View {
    
    let listing : Listing
    
    //back button pr click and dismiss the page
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
                ZStack(alignment: .topLeading){
                    //listResouce file call
                    ListingResourseView(listing: listing)
                        .frame(height: 268)
                        .ignoresSafeArea(edges: .top) // only image ignores safe area

                    
                    //back button
                    Button{
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                            .background {
                                Circle()
                                    
                                    .frame(width: 40, height: 40)
                            }
                            .padding(34)
                            
                    }
                }
              
                
            VStack(alignment: .leading){
                Text("\(listing.title)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName:"star.fill")
                    Text("\(listing.rating, specifier: "%.1f")")

                    Text("28 reviews")
                        .fontWeight(.semibold)
                        .underline()
                    
                }
                VStack{
                    Text("\(listing.city), \(listing.state)")
                }
                
            }
            .font(.footnote)
            .padding()
            .frame(maxWidth: .infinity , alignment: .leading)
            
            Divider()
            
            HStack{
                VStack(alignment: .leading){
                    Text("Entire \(listing.type.description) Hosted By \(listing.ownerName)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(width: 250,alignment: .leading)
                    
                    HStack{
                        Text("\(listing.numberOfGuests) guest")
                        Text("\(listing.numberOfBedrooms)bedrooms")
                        Text("\(listing.numberOfBeds) beds")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                }
                .padding()
                Spacer()
                
                VStack{
                    Image("Image")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60 ,height: 60)
                        .clipShape(.circle)
                }
                
            }
            .font(.footnote)
            
            Divider()
            
            VStack(alignment: .leading, spacing:16){
                ForEach(listing.feature){ feature in
                    HStack{
                        Image(systemName: feature.imageName)
                        VStack{
                            Text(feature.subtitle)
                                .font(.caption)
                        }
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()
            
            VStack(alignment: .leading){
                Text("Where you'll sleep")
                    .fontWeight(.semibold)
                ScrollView(.horizontal){
                    HStack(spacing: 15){
                        ForEach(1 ..< listing.numberOfBeds ){ box in
                            VStack{
                                Image(systemName: "bed.double")
                                     Text("Bedroom \(box)")
                            }
                            .frame(width: 120, height: 80)
                            .padding()
                            .overlay{
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(lineWidth: 0.8)
                                    .shadow(color: .black.opacity(0.6), radius: 5)
                            }
                        }
                    }
                    .padding()
                }
                

            }
            .padding()
            
           Divider()
            
            VStack( alignment: .leading ,spacing: 15){
                Text("What this place offers")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                ForEach(listing.amenities) { amenity in
                    
                    HStack(spacing:20){
                        Image(systemName: amenity.imageName)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                    
                }
            }
            .padding()
            
            Divider()
            
        }
        .ignoresSafeArea()   //  fixed white padding issue
        .padding(.bottom, 72)
        //use zstack also and overlay both ..
        .overlay(alignment: .bottom){
            VStack(alignment: .leading){
                Divider()
                    .padding(.bottom)
                
                HStack(spacing: 20){
                    VStack(alignment: .leading){
                        Text("$\(listing.pricePerNights)")
                            .fontWeight(.bold)
                        Text("Total before taxes")
                        Text("Oct - 15 - 20")
                            .fontWeight(.bold)
                            .underline()
                        
                    }
                    .font(.footnote)
                    
                    Spacer()
                    
                    Button{
                        
                        }
                           label: {
                        Text("Reserve")
                                   .frame(width: 150, height: 50)
                                   .background(Color.pink)
                                   .foregroundStyle(.white)
                                   .clipShape(RoundedRectangle(cornerRadius:15))
                    }
                    
                }
                .padding(.horizontal,32)
            }
            .background(.white)
            
        }
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
