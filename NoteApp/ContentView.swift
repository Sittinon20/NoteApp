//
//  ContentView.swift
//  NoteApp
//
//  Created by Sittinon Phiwkliang on 7/4/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        
        VStack {
            
            Spacer().frame(height: 50)
            
            VStack(alignment: .leading, spacing: 5) {

                Text("Note App")
                    .bold()
                    .font(.system(size: 40))
                    .padding()
                Text("Capture what’s on your mind & get a reminder later at the right place or time. You can also add voice memo & other features")
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                    .padding(.leading)
            }
            Spacer()
            
            ZStack(alignment: .bottomTrailing){
                
                Image("splash")
                    .resizable()
                    .edgesIgnoringSafeArea(.bottom)
                Button(action: {
                    isPresented.toggle()
                }, label:  {
                    HStack {
                        Text("Let's Start")
                            .bold()
                        Image(systemName: "arrow.right")
                    }
                    .fullScreenCover(isPresented: $isPresented, content: {
                        HomeView()
                    })
                    .foregroundColor(.white)
                    .frame(width: 150, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(.systemBlue))
                    .cornerRadius(50)
                    .padding()
                })
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
