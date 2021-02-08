//
//  ContentView.swift
//  CarouselTest
//
//  Created by Jeff Mason on 2/4/21.
//

import SwiftUI


struct ContentView: View {
    @State var selected : Int = 0
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Wheel of Cheese")
                .font(.system(size: 45))
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
                .padding(.top, 50)
            

        TabView(selection: $selected) {
            
            // Images...
            ForEach(1...4,id: \.self){ index in
                
                // Geometry reader for parralax effect
                

                
                ZStack {
                     
          
 
                    
                    GeometryReader{ reader in
                        
                        Image("p\(index)")
                            .resizable()
                            .frame(width: 400.0, height: 400.0)
                            .aspectRatio(contentMode: .fill)
                            .offset(x: -reader.frame(in: .global).minX)

                    }
                    .frame(height: 400.0)
                    .cornerRadius(15)
                    .padding(10)
                    .background(Color.white)
                    .cornerRadius(15)
                    //
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5 )
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: -5, y: 5 )
                    // decreasing width by padding
                    // so outer view only decreased
                    // inner image will be full width
                    .padding(.horizontal,25)
                    
                    Image("cheeseplate")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5 )
                        .padding(5)
                        .background(Color.white)
                        .clipShape(Circle())
                        .offset(x: 150, y: 210)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


