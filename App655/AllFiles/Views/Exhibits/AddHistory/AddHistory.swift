//
//  AddHistory.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct AddHistory: View {
    
    @StateObject var viewModel: ExhibitsViewModel
    @StateObject var collectModel: CollectionsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                        
                        Text("Back")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.hisCol = collectModel.selectedCollection?.colTitle ?? ""
                        
                        viewModel.hisPhoto = viewModel.currentPhoto
                        
                        viewModel.numExhibits += 1
                        
                        viewModel.addHistory()
                        
                        viewModel.currentPhoto = ""
                        viewModel.hisTitle = ""
                        viewModel.hisCountry  = ""
                        viewModel.hisYear = ""
                        viewModel.hisCondition = ""
                        viewModel.hisDescr = ""
                        
                        viewModel.fetchHistories()
                        collectModel.fetchCollections()
                        
                        withAnimation(.spring()) {
                            
                            router.wrappedValue.dismiss()
                        }
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.green)
                            .font(.system(size: 15, weight: .semibold))
                    })
                    .opacity(viewModel.hisTitle.isEmpty || viewModel.hisCountry.isEmpty || viewModel.hisYear.isEmpty || viewModel.hisCondition.isEmpty || viewModel.hisDescr.isEmpty ? 0.5 : 1)
                    .disabled(viewModel.hisTitle.isEmpty || viewModel.hisCountry.isEmpty || viewModel.hisYear.isEmpty || viewModel.hisCondition.isEmpty || viewModel.hisDescr.isEmpty ? true : false)
                }
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.photos, id: \.self) { index in
                                
                                    Button(action: {
                                        
                                        viewModel.currentPhoto = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.currentPhoto.isEmpty {
                                    
                                    Image("pic")
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                    
                                } else {
                                    
                                    Image(viewModel.currentPhoto)
                                        .resizable()
                                        .frame(width: 80, height: 80)
                                }
                            })
                            .padding(.trailing)

                            
                            VStack(alignment: .leading) {
                                
                                Text("Title")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .semibold))
                                
                                ZStack(alignment: .leading, content: {
                                    
                                    Text("Text")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                        .opacity(viewModel.hisTitle.isEmpty ? 1 : 0)
                                    
                                    TextField("", text: $viewModel.hisTitle)
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .semibold))
                                    
                                })
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                            }
                        }
                        
                        Text("Country of origin")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.hisCountry.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisCountry)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        Text("Year of release")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.hisYear.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisYear)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        Text("Condition")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.hisCondition.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisCondition)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        Text("Description")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            Text("Text")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .opacity(viewModel.hisDescr.isEmpty ? 1 : 0)
                            
                            TextField("", text: $viewModel.hisDescr)
                                .foregroundColor(Color.black)
                                .font(.system(size: 14, weight: .semibold))
                            
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            LazyHStack {
                                
                                ForEach(collectModel.collections, id: \.self) { indexer in
                                
                                    Button(action: {
                                        
                                        collectModel.selectedCollection = indexer
                                        
                                    }, label: {
                                        
                                        VStack(alignment: .leading) {
                                            
                                            Text(indexer.colTitle ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 16, weight: .semibold))
                                            
                                            Text(indexer.colDescr ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 12, weight: .regular))
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 100)
                                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim").opacity(collectModel.selectedCollection == indexer ? 1 : 0.5), lineWidth: 2))
                                        .padding(1)
                                    })
                                }
                            }
                        }
                        .frame(height: 110)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg")))
                }
            }
            .padding()
        }
        .onAppear{
            
            collectModel.fetchCollections()
        }
    }
}

#Preview {
    AddHistory(viewModel: ExhibitsViewModel(), collectModel: CollectionsViewModel())
}
