import SwiftUI

struct ExperiencesShow: View {
    
    let title : String
    let subtitle : String
    let price : String
    let location : String
    let image : String
    
    var body: some View {
        HStack(spacing: 12) {
            
            // Image
            Image(image)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(8)
            
            // Text content
            VStack(alignment: .leading, spacing: 6) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            // Price + Location
            VStack(alignment: .trailing, spacing: 6) {
                Text(price)
                    .fontWeight(.semibold)
                    .font(.footnote)
                
                Text(location)
                    .font(.caption)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .foregroundColor(.black)
                    .background(Color.blue.opacity(0.3))
                    .clipShape(Capsule())
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.15), radius: 8, x: 0, y: 4)
        )
        .padding(.horizontal)
    }
}

#Preview {
    ExperiencesShow(title: "Flat", subtitle: "Full furnished", price: "300$", location: "London",image: "Image 2")
}
