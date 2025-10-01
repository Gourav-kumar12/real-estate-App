//
//  showDestinationSearchView.swift
//  airbnb
//
//  Created by Gourav  on 12/09/25.
//

import SwiftUI

//create enum to handle the @states
enum DestinationSearchOptions{
    case location
    case dates
    case guests
}

struct showDestinationSearchView: View {
    //bind to destinationSearchView
    //just define one state and handle all case
    
    @Binding var show :Bool
    @State private var destination = ""
    @State private var selectedOption :DestinationSearchOptions = .location
    @State private var numGuests = 0
    
    
var body: some View {
    
    VStack{
        HStack{
            
            Button{
                withAnimation(.snappy) {
                    show.toggle()
                }
                
            } label: {
                Image(systemName: "xmark.circle")
                    .foregroundStyle(.black)
                    .imageScale(.large)
            }
            
            Spacer()
            
            if !destination.isEmpty{
                Button("clear"){
                    destination = ""
                }
                .foregroundStyle(.black)
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            
            
        }
        .padding()
        //search bar
        VStack(alignment: .leading){
            if selectedOption == .location{
                
                Text("Where to ?")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                HStack{
                    Image(systemName: "magnifyingglass")
                    
                    TextField("Search Destination ", text:$destination)
                        .font(.subheadline)
                    
                }
                .frame(height: 44)
                .padding(.horizontal)
                .overlay{
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 2)
                        .foregroundStyle(.gray)
                }
                
            }
            else{
                CollapsedPickerView(title : "Where", description : "Add location")
            }
        }
        .padding()
        .frame(height: selectedOption == .location ? 120 : 62)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: 5)
        .padding()
        .onTapGesture {
            withAnimation(.snappy)
            {
                selectedOption = .location
            }
            
        }
        
        
        //Text Date view
        
        
        //text guets view
        VStack(alignment: .leading){
            if selectedOption == .guests{
                Text("Who's comming ")
                    .font(.title)
                    . fontWeight(.semibold)
                
                //count
                Stepper{
                    Text("\(numGuests) adults")
                } onIncrement: {
                    numGuests += 1
                } onDecrement: {
                    guard numGuests > 0 else {return}
                    numGuests -= 1
                }
                
            }
            else{
                CollapsedPickerView(title : "Who", description : "Add guests")
            }
        }
        .padding()
        .frame(height: selectedOption == .guests ? 120 : 62)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(radius: 5)
        .padding()
        .onTapGesture {
            withAnimation(.snappy)
            {
                selectedOption = .guests
            }
            
            }
        
          }
            Spacer()
       }
       
    }

#Preview {
    showDestinationSearchView(show: .constant(false))
}


struct CollapsedPickerView : View {
    let title : String
    let description : String
    
    var body: some View {
        VStack{
            HStack{
                Text(title)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
                    .fontWeight(.semibold)
                    .font(.subheadline)
            
        }
    }
}
