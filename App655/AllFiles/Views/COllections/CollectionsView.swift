//
//  CollectionsView.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct CollectionsView: View {
    
    @StateObject var viewModel = CollectionsViewModel()
    @StateObject var exhibModel = ExhibitsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Collections")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                
                HStack {
                    
                    VStack {
                        
                        Text("\(viewModel.numCol)")
                            .foregroundColor(Color("prim"))
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("Collections")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .medium))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    VStack {
                        
                        Text("\(viewModel.numExhibits)")
                            .foregroundColor(Color.black)
                            .font(.system(size: 24, weight: .bold))
                        
                        Text("Exhibits")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .medium))
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        VStack {
                            
                            Image(systemName: "plus")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .medium))
                            
                        }
                        .frame(width: 75, height: 100)
                        .background(RoundedRectangle(cornerRadius: 15).stroke(Color("prim")))
                    })
                    
                }
                .padding(.bottom)
                
                if viewModel.collections.isEmpty {
                    
                    VStack(spacing: 15) {
                        
                        Image("empty")
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.collections, id: \.self) { index in
                                
                                VStack {
                                    
                                    HStack {
                                        
                                        VStack(alignment: .leading, spacing: 8) {
                                            
                                            Text(index.colTitle ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.colDescr ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .frame(height: 85)
                                        
                                        Button(action: {
                                            
                                            viewModel.selectedCollection = index
                                            
                                            withAnimation(.spring()) {
                                                
                                                viewModel.isDetail = true
                                            }
                                            
                                        }, label: {
                                            
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(.white)
                                                .font(.system(size: 17, weight: .medium))
                                                .frame(width: 60, height: 85)
                                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                                        })
                                    }
                                    
                                    if exhibModel.histories.isEmpty {
                                        
                                        HStack {
                                            
                                            Image("pic")
                                                .resizable()
                                                .frame(width: 90, height: 90)
                                            
                                            Spacer()
                                        }
                                        
                                    } else {
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        LazyHStack {
                                            
                                            ForEach(exhibModel.histories.filter{($0.hisCol ?? "") == index.colTitle}, id: \.self) { indexer in
                                                
                                                Image(indexer.hisPhoto ?? "")
                                                    .resizable()
                                                    .frame(width: 90, height: 90)

                                            }
                                        }
                                    }
                                    .frame(height: 100)
                                }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 20).fill(Color("bg2")))
                            }
                            
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear{
            
            viewModel.fetchCollections()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddCollection(viewModel: viewModel)
        })
        .onAppear {
            
            exhibModel.fetchHistories()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            ColDetail(viewModel: viewModel, exhibModel: exhibModel)
        })
    }
}

#Preview {
    CollectionsView()
}
