import SwiftUI
import Combine

struct PostView: View {
    @EnvironmentObject var postViewModel: PostViewModel
    
    @State private var title = ""
    @State private var location = ""
    @State private var price = ""
    @State private var imageName = ""
    @State private var showPopup = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section("Property Details") {
                        TextField("Title (e.g. Cozy Apartment)", text: $title)
                            .onSubmit { hideKeyboard() }
                        
                        TextField("Location (e.g. London)", text: $location)
                            .onSubmit { hideKeyboard() }
                        
                        TextField("Price (e.g. 500$)", text: $price)
                            .keyboardType(.numberPad)
                            .onSubmit { hideKeyboard() }
                        
                        TextField("Image name (asset)", text: $imageName)
                            .onSubmit { hideKeyboard() }
                    }
                }
                
                // Button OUTSIDE form so tap always works
                Button(action: {
                    postListing()
                    hideKeyboard()
                }) {
                    Text("Post Property")
                        .font(.headline)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("Post Property")
            .overlay(
                Group {
                    if showPopup {
                        Text("✅ Property posted!")
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.8))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()
                            .transition(.move(edge: .top).combined(with: .opacity))
                    }
                },
                alignment: .top
            )
            .onTapGesture { hideKeyboard() }
        }
    }
    
    private func postListing() {
        
        guard !title.isEmpty, !location.isEmpty, !price.isEmpty, !imageName.isEmpty else {
            print(" Please fill all fields")
            return
        }
        
       
        let cleanPrice = Int(price.replacingOccurrences(of: "$", with: "")) ?? 0
        
        let newListing = Listing(
            id: UUID().uuidString,
            ownerUid: UUID().uuidString,
            ownerName: "User",
            ownerImageUrl: "male-profile.photo",
            numberOfBedrooms: 1,
            numberOfBathrooms: 1,
            numberOfGuests: 1,
            numberOfBeds: 1,
            pricePerNights: cleanPrice,
            imageURLs: [imageName],
            address: location,
            city: location,
            state: "",
            title: title,
            rating: 5.0,
            feature: [],
            amenities: [],
            type: .apartment,
            isUserPost: true
        )
        
        postViewModel.addListing(newListing)
        print("✅ Posted new listing: \(newListing)")
        
        withAnimation { showPopup = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation { showPopup = false }
        }
        
        // ✅ Clear form fields
        title = ""
        location = ""
        price = ""
        imageName = ""
    }
}

//  Keyboard Dismiss Helper
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}
