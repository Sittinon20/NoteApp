//
//  NoteDetailView.swift
//  NoteApp
//
//  Created by Sittinon Phiwkliang on 8/4/2564 BE.
//

import SwiftUI

struct NoteDetailView: View {
    
    @Environment(\.presentationMode) var presentedMode: Binding<PresentationMode>
    let note = Note.dummies.first!
    var leadingButton: some View {
        Button(action: {
            presentedMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    Text("New Note")
                        .font(.system(size: 23))
                        .foregroundColor(.black)
                    Text(note.date)
                        .font(.system(size: 13))
                        .foregroundColor(.black)
                    Text(note.description! + note.description! + note.description! + note.description!)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineSpacing(10.0)
                        .foregroundColor(.gray)
                        .padding(.top)
                    ZStack(alignment: .topTrailing) {
                        Image("new.note.image")
                            .frame(maxWidth: .infinity)
                            .padding(.top)
                            .cornerRadius(8)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(.systemGray6))
                            .padding()
                            .padding(.top, 5)
                    }
                }
                .padding()
            }
            HStack {
                Spacer()
                Image(systemName: "music.note")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(.systemRed))
                Spacer()
                Image(systemName: "photo")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(.systemGreen))
                Spacer()
                Image(systemName: "bell")
                    .frame(width: 24, height: 24)
                    .foregroundColor(Color(.systemBlue))
                Spacer()
                Image(systemName: "checkmark.circle")
                    .frame(width: 24, height: 24)
                    .foregroundColor(.yellow)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 74)
            .background(Color.white)
            .clipShape(RoundedCorner.init(radius: 21, corners: [.topLeft, .topRight]))
            .shadow(color: Color.black.opacity(0.12), radius: 21, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: -6)
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: leadingButton,
                            trailing: Image(systemName: "checkmark")
                                .foregroundColor(.blue))
        .navigationBarBackButtonHidden(true)
    }
    
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 0.0
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: .init(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct NoteDetailViewPreview: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            NoteDetailView()
        }
    }

    
}
