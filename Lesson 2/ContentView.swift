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
        ScrollView {
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
                
                Text("Skill")
                    .bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    ForEach(me.skills, id: \.self) { skill in
                        VStack {
                            Image(skill.lowercased())
                                .resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 50)
                            Text(skill)
                        }.frame(width: 80)
                    }
                }
                
                Text("Experience")
                    .bold().font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack (spacing: 0)  {
                    ForEach(me.experiences.indices, id: \.self) { index in
                        HStack {
                            DotLineShape(lineWidth: 2,
                                         dotSize: 10,
                                         style: index == 0 ? .bottomHalf :
                                                index == me.experiences.count - 1 ? .topHalf : .full)
                                .frame(width: 70)
                                .foregroundColor(.secondary)
                            
                            let exp = me.experiences[index]
                            VStack (spacing: 8) {
                                Group {
                                    Text("\(exp.start) － \(exp.end)").foregroundColor(.secondary)
                                    Text(exp.title).bold()
                                    Text(exp.company).padding(.bottom, 30)
                                }.frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                    }
                }
            }.padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
