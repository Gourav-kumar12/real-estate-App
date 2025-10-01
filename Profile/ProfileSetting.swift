

import SwiftUI


struct ProfileSetting: View {
    
    let imageName : String
    let title : String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                
                Text(title)
                    .font(.subheadline)
                
                Spacer()
                 Image(systemName: "chevron.right")
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileSetting(imageName : "gear" , title : "Setting")
}
