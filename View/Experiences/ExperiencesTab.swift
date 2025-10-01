
import SwiftUI

struct ExperiencesTab: View {
    var body: some View {
        VStack {
            Text("Experience- land")
        }
        .font(.title)
        .fontWeight(.semibold)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.blue.opacity(0.15))
        
        List {
            
            HomeShow(title: "Villa", subtitle: "semi-furnshed", price: "600$", location: "dubai", image: "Home-2")
            HomeShow(title: "Vila", subtitle: "full-furnshed", price: "800$", location: "USA", image: "Home-3")
            HomeShow(title: "flat", subtitle: "full-furnshed", price: "5000$", location: "dubai", image: "Home-4")
            HomeShow(title: "flat", subtitle: "full-furnshed", price: "500$", location: "london", image: "Home-5")
            HomeShow(title: "flat", subtitle: "full-furnshed", price: "500$", location: "london", image: "Home-1")
        }
    }
}

#Preview {
    ExperiencesTab()
        .environmentObject(WishlistManager())
}
