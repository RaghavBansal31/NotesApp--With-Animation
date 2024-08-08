//
//  NewNoteView.swift
//  Notes
//
//  Created by Consultant on 7/30/23.
//

import SwiftUI

struct NewNoteView: View {
    
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var textBody = ""
    
    var body: some View {
        ZStack{
            LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                .frame(width:100, height: 200).padding()
            Form(){
                
                Section{
                    TextField(("Name Of Note"), text: $name).foregroundColor(.white)
                    
                    VStack{
                        TextField("Enter Text Here", text: $textBody, axis: .vertical).frame(width:200, height:200)
                    }
                    
                    HStack{
                        Spacer()
                        Button("Save"){
                            DataController().addNote(name: name, textBody: textBody, context: managedObjContext)
                            dismiss()
                        }.buttonStyle(.borderedProminent)
                        Spacer()
                        
                        
                        
                    }
                }
                .listRowBackground(Color.clear)
            }
        }
        .background(Color.clear)
        .scrollContentBackground(.hidden)

    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
