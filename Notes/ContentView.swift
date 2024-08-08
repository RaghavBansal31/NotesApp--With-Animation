//
//  ContentView.swift
//  Notes
//
//  Created by Consultant on 7/26/23.
//

import SwiftUI
import CoreData


struct ContentView: View {
    var body: some View {
        
            NavigationStack {
                
                VStack(spacing:120){
                    LottieView(name: "animation", loopMode: .loop, animationSpeed: 1.0)
                        .frame(width:100, height: 100).padding()
                    VStack(spacing:20){
                        Text("Welcome To The Notes Application").font(.headline)
                        Text("Click Below To go To the Notes Application")
                        
                        NavigationLink {
                            Home()
                        } label: {
                            Text("Click Me")
                        }.buttonStyle(.borderedProminent).foregroundColor(Color.black)
                        
                    }
                }
                
            
        }
              
        
      }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
