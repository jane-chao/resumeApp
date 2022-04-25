//
//  ContactView.swift
//  MyResume
//
//  Created by Jane Chao on 22/04/24.
//

import SwiftUI

struct ContactView: View {
    @Binding var isShowing: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "phone.fill")
                    .resizable().aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.brown))
                    .padding(10)
                    .onTapGesture { openUrl(Resume.shared.phoneUrl) }
                
                ForEach(Resume.shared.socialMedia, id: \.name) { media in
                    Image(media.name.lowercased())
                        .resizable().aspectRatio(contentMode: .fit)
                        .padding(10)
                        .onTapGesture { openUrl(media.url) }
                }
            }
            
            Text("取消")
                .font(.title3)
                .foregroundColor(.secondary)
                .onTapGesture { isShowing = false  }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color(uiColor: .tertiarySystemBackground)))
        .padding()
    }
    
    
    func openUrl(_ url: String) {
        let url = URL(string: url)!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
            return
        }
        print("不能打開 做點其他事情")
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(isShowing: Binding.constant(true))
            .background(.yellow)
    }
}
