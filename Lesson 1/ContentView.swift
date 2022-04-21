//
//  ContentView.swift
//  MyResume
//
//  Created by Jane Chao on 22/04/20.
//

import SwiftUI

struct ContentView: View {
    let me = Resume.shared
    
    
    var body: some View {
        VStack (spacing: 30) {
            HStack {
                Image("avatar")
                    .resizable().aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .frame(width: 200)
                
                VStack (spacing: 20) {
                    Text(me.name)
                        .font(.title).bold()
                    Text(me.title)
                    Label(me.location, systemImage: "location.fill").foregroundColor(.secondary)
                    
                }
            }
            
            Text(me.bio).font(.title3).lineSpacing(10)
            
            Text("Contact Me")
                .foregroundColor(.white)
                .font(.title2.weight(.bold))
                .padding(.vertical, 10)
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.brown))
            
            
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
