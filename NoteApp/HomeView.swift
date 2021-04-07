//
//  HomeView.swift
//  NoteApp
//
//  Created by Sittinon Phiwkliang on 8/4/2564 BE.
//

import SwiftUI

struct HomeView: View {
    
    private var _leadingTitle: some View {
        Text("My Notes")
            .bold()
            .font(.system(size: 23))
            .foregroundColor(.black)
    }
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor(Color.white)
        UINavigationBar.appearance().tintColor = UIColor(Color.white)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Search anything", text: .constant(""))
                        .font(.system(size: 14))
                }
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(8)
                .padding()
                NoteTypeView()
                ZStack(alignment: .bottomTrailing) {
                    ScrollView(.vertical, showsIndicators: true, content: {
                            ForEach(Note.dummies) { eachNote in
                            NoteViewItem(note: eachNote)
                        }
                    })
                    NavigationLink(destination: NoteDetailView.init()) {
                        HStack {
                            Text("Create").bold()
                            Image(systemName: "plus")
                        }
                        .foregroundColor(.white)
                        .frame(width: 130, height: 50)
                        .background(Color(.systemBlue))
                        .cornerRadius(30.5)
                        .padding()
                    }.padding()
                }
            }
            .background(Color(.systemBackground))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: _leadingTitle, trailing: Image("profile"))
        }
    }
}

struct NoteTypeView: View {
    
    @State var selectedType: TypeView = .allNotes
    
    enum TypeView: String, CaseIterable, Identifiable {
        var id: String {
            if case .allNotes = self {
                return "All Notes"
            }
            return rawValue.capitalized
        }
        
        case allNotes
        case reminder
        case audio
        case images
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(TypeView.allCases) { eachType in
                    Button(action: {
                        selectedType = eachType
                    }, label: {
                        Text(eachType.id)
                            .font(.callout)
                            .foregroundColor(selectedType == eachType ? .white : .secondary)
                            .padding()
                    })
                    .frame(height: 30)
                    .background(selectedType == eachType ? Color(.systemBlue) : Color(.systemGroupedBackground))
                    .cornerRadius(4)
                }
            }
            .padding(.leading, 5)
        })
    }
}

struct NoteViewItem: View {
    
    let note: Note
        
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            HStack {
                Image(systemName: note.type.displayImage)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(note.type.displayColor)
                    .cornerRadius(20)
                VStack(alignment: .leading) {
                    Text(note.title)
                        .font(.system(size: 16, design: .serif))
                        .foregroundColor(.black)
                    Text(note.date)
                        .font(.system(size: 12, design: .default))
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .background(Color(.systemBackground))
                .padding(.trailing)
                .padding(.leading)
            
            note.image != nil ? Image(note.image!)
                .frame(maxWidth: .infinity)
                .padding(.top)
                .cornerRadius(8) : nil
            
            note.description != nil ? Text(note.description!)
                .font(.system(.subheadline))
                .foregroundColor(Color(.systemGray))
                .padding() : nil
            
            note.type == .audio ?
            HStack {
                Image(systemName: "play.fill")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .background(Color(.systemBlue))
                    .cornerRadius(20)
                    .padding(.leading)
                Image("audio.sample")
                    .frame(maxWidth: .infinity)
                    .padding(.leading)
                    .padding(.trailing)
                }.padding() : nil
        })
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.04), radius: 8, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: 3)
        .padding()
    }
}

private extension Note.`Type` {
    var displayImage: String {
        switch self {
        case .audio:
            return "music.note"
        case .document:
            return "doc"
        case .reminder:
            return "bell"
        }
    }
    
    var displayColor: Color {
        switch self {
        case .audio:
            return Color(.systemRed)
        case .document:
            return Color(.systemBlue)
        case .reminder:
            return Color(.systemGreen)
        }
    }
}

struct  HomeViewPreView: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
