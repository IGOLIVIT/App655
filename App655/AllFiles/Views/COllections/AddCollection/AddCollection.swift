//
//  AddCollection.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct AddCollection: View {
    
    @StateObject var viewModel: CollectionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack(spacing: 15) {
                
                Text("Collection")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Text("Title")
                            .foregroundColor(.black)
                            .font(.system(size: 16,weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colTitle.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colTitle)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                        .padding(1)
                        
                        Text("Description")
                            .foregroundColor(.black)
                            .font(.system(size: 16,weight: .medium))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.colDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.colDescr)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.black))
                        .padding(1)
                        
                        HStack {
                            
                            Button(action: {
                                
                                withAnimation(.spring()) {
                                    
                                    viewModel.isAdd = false
                                }
                                
                            }, label: {
                                
                                Text("Cancel")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(RoundedRectangle(cornerRadius: 15).stroke(Color.black))
                                    .padding(1)
                            })
                            
                            Button(action: {
                                
                                viewModel.numCol += 1
                                
                                viewModel.addCollection()
                                
                                viewModel.colTitle = ""
                                viewModel.colDescr = ""
                                
                                viewModel.fetchCollections()
                                
                                withAnimation(.spring()) {
                                    
                                    router.wrappedValue.dismiss()
                                }
                                
                            }, label: {
                                
                                Text("Add")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 55)
                                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                            })
                            .opacity(viewModel.colTitle.isEmpty || viewModel.colDescr.isEmpty ? 0.5 : 1)
                            .disabled(viewModel.colTitle.isEmpty || viewModel.colDescr.isEmpty ? true : false)
                        }
                        .padding(.top)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddCollection(viewModel: CollectionsViewModel())
}
