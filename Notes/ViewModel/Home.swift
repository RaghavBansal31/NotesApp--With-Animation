//
//  Home.swift
//  Notes
//
//  Created by Consultant on 7/26/23.
//

import SwiftUI

struct Home: View {
    
    
    @Environment(\.managedObjectContext)  var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var entity: FetchedResults<Entity>
    
    @State var showingNewNoteView = false
    @State var PopOver = false
    @StateObject var dataController = DataController()
    @State private var query = ""
    
    var body: some View {
       
        NavigationStack{
            ZStack{
                LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                    .frame(width:100, height: 100).padding()
                VStack{
                    
                    
                    List{
                        ForEach(entity) { entity in
                            NavigationLink {
                                AddedNotePage(entity: entity)
                            } label: {
                                HStack{
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(entity.name!).bold()
                                        Text("\(entity.textBody!)")
                                    }
                                    
                                    Spacer()
                                    Text(calTime(date:entity.date!)).foregroundColor(.gray)
                                }
                                
                                
                            }
                            .listRowBackground(Color.clear)
//
                            
                            
                            
                            
                            
                        }
                        .onDelete(perform: deleteNote)
                        
                        
                        
                        
                    }
                    
                    .background(Color.clear)
                    .scrollContentBackground(.hidden)
                    .listStyle(.automatic)
                    
                    
                    
                    
                    
                    
                }
                
                
                
                
                
                .searchable(text: $query, prompt: "Search Your Note")
                .onChange(of: query) { newValue in
                    entity.nsPredicate = searchPredicate(query: newValue)
                }
            }// ZSTACK
            
            
        }
            .toolbar{
                ToolbarItemGroup(placement: .bottomBar){
                    Button {
                        showingNewNoteView.toggle()
                    } label: {
                        Image(systemName: "plus.app.fill").resizable().frame(width:40,height:40)
                    }
                    
                }
                
                ToolbarItem (placement: .navigationBarTrailing){
                    EditButton()
                }
            }
            .sheet(isPresented: $showingNewNoteView) {
                NewNoteView()
            }
            
            
            
        
        }
        
        private func calTime(date: Date) -> String{
            let minutes = Int(-date.timeIntervalSinceNow)/60
            let hours = minutes/60
            let days = hours/24
            
            
            if minutes < 120{
                return "\(minutes) minutes ago"
            }else if minutes >= 120 && hours < 48{
                return "\(hours) hours ago"
            }else{
                return "\(days) days ago"
            }
        }
        
        
        private func  deleteNote(offsets: IndexSet){
            withAnimation {
                offsets.map {entity[$0]}.forEach(managedObjContext.delete)
                DataController().save(context: managedObjContext)
            }
            
        }
        
        private func searchPredicate(query: String) -> NSPredicate? {
            if query.isEmpty { return nil }
            return NSPredicate(format: "%K BEGINSWITH[cd] %@",
                               #keyPath(Entity.name), query)
        }
    }



struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}




