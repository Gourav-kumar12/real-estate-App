import SwiftUI

struct ProfileView: View {
    @State private var userName: String = "User Account"
    @State private var isLoggedIn: Bool = false
    
    var body: some View {
        Group {
            if isLoggedIn {
                //  After login show MainTabView
                MainTabView()
            } else {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        // Editable profile name
                        HStack {
                            TextField("Enter your name", text: $userName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                        }
                        
                        //  Login Button
                        Button {
                            withAnimation {
                                isLoggedIn = true
                            }
                        } label: {
                            Text("Log in")
                                .foregroundStyle(.white)
                                .font(.headline)
                                .frame(width: 360, height: 50)
                                .background(Color.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        .padding()
                        
                        HStack {
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.bold)
                                .underline()
                        }
                        .font(.caption)
                        .padding(.horizontal)
                    }
                    
                    // Profile settings
                    VStack(spacing: 25) {
                        // Open Apple Account Settings
                        Button(action: openAppleAccountSettings) {
                            ProfileSetting(imageName: "gear", title: "Account Setting")
                        }
                        
                        // Open Apple Help Page
                        Button(action: openAppleSupport) {
                            ProfileSetting(imageName: "questionmark.circle", title: "Get Help")
                        }
                        
                        // Open Apple Privacy Page
                        Button(action: openApplePrivacy) {
                            ProfileSetting(imageName: "book", title: "Privacy")
                        }
                        .padding(.bottom, 25)
                    }
                    .padding()
                }
            }
        }
    }
    
    // Open Apple Account Settings (iPhone Settings)
    private func openAppleAccountSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    // Apple Support page
    private func openAppleSupport() {
        if let url = URL(string: "https://support.apple.com") {
            UIApplication.shared.open(url)
        }
    }
    
    // Apple Privacy page
    private func openApplePrivacy() {
        if let url = URL(string: "https://www.apple.com/legal/privacy/") {
            UIApplication.shared.open(url)
        }
    }
}

#Preview {
    ProfileView()
}
