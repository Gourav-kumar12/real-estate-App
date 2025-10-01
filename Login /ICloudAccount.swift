import Foundation
import SwiftUI
import Combine
import CloudKit

// MARK: - ViewModel
class ICloudAccountViewModel: ObservableObject {
    @Published var isSignedInToiCloud: Bool = false
    @Published var error: String = ""
    
    init() {
        getiCloudStatus()
    }
    
    private func getiCloudStatus() {
        CKContainer.default().accountStatus { [weak self] returnedStatus, _ in
            DispatchQueue.main.async {
                switch returnedStatus {
                case .available:
                    self?.isSignedInToiCloud = true
                case .noAccount:
                    self?.error = CloudKitError.iCloudAccountNotfound.rawValue
                case .couldNotDetermine:
                    self?.error = CloudKitError.iCloudAccountNotDetermined.rawValue
                case .restricted:
                    self?.error = CloudKitError.iCloudAccountRestricted.rawValue
                default:
                    self?.error = CloudKitError.iCloudAccountUnknown.rawValue
                }
            }
        }
    }
    
    enum CloudKitError: String, LocalizedError {
        case iCloudAccountNotfound
        case iCloudAccountNotDetermined
        case iCloudAccountRestricted
        case iCloudAccountUnknown
    }
}

// MARK: - iCloudAccount View
struct ICloudAccount: View {
    @StateObject private var vm = ICloudAccountViewModel()
    
    //  Notification state
    @State private var showNotification = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Group {
                if vm.isSignedInToiCloud {
                    MainTabView()
                        .onAppear {
                            triggerNotification()
                        }
                } else {
                    VStack(spacing: 16) {
                        Text("iCloud Status")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        if !vm.error.isEmpty {
                            Text("❌ \(vm.error)")
                                .foregroundColor(.red)
                        } else {
                            ProgressView("Checking iCloud...")
                        }
                    }
                    .padding()
                }
            }
            
            //  Notification Banner
            if showNotification {
                Text("✅ Apple Authentication Login Successful")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
            }
        }
        .animation(.spring(), value: showNotification)
    }
    
    // : - Trigger Notification
    private func triggerNotification() {
        showNotification = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showNotification = false
            }
        }
    }
}

#Preview {
    ICloudAccount()
        .environmentObject(WishlistManager())
        .environmentObject(PostViewModel(service: ExploreServices()))
}
