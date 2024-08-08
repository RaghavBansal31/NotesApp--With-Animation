//
//  AddedNotePage.swift
//  Notes
//
//  Created by Consultant on 7/30/23.
//

import SwiftUI

struct AddedNotePage: View {
    
    
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var entity: FetchedResults<Entity>.Element
    
    //-----------------
    @State private var name = ""
    @State private var textBody = ""
    
    //-----------------
    
    var body: some View {
        ZStack{
            LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                .frame(width:100, height: 100).padding()
        Form(){
           
                Section{
                    TextField("\(entity.name!)", text: $name)
                        .onAppear{
                            name = entity.name!
                            textBody = entity.textBody!
                        }
                    
                    VStack{
                        TextField("Enter Text Here", text: $textBody, axis: .vertical).frame(width:200, height:200)
                    }
                    HStack{
                        Spacer()
                        Button("Save"){
                            DataController().editNote(entity:entity,name: name, textBody: textBody, context: managedObjContext)
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

//struct AddedNotePage_Previews: PreviewProvider {
//    static var previews: some View {
//        AddedNotePage()
//    }
//}
