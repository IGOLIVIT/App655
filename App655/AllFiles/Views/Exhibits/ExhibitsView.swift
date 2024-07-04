//
//  ExhibitsView.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct ExhibitsView: View {

    @StateObject var viewModel = ExhibitsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Exhibits")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .bold))
                                    
                    VStack {
                        
                        Text("\(viewModel.numExhibits)")
                            .foregroundColor(Color.black)
                            .font(.system(size: 28, weight: .bold))
                        
                        Text("Exhibits")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .medium))
                        
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .padding(.bottom)
                
                HStack {
                    
                    Text("History")
                        .foregroundColor(.white)
                        .font(.system(size: 24, weight: .semibold))
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isAdd = true
                        }
                        
                    }, label: {
                        
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .medium))
                    })
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                
                if viewModel.histories.isEmpty {
                    
                    VStack(spacing: 20) {
                        
                        Image("empty")
                        
                        Text("You haven't added any entries")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .semibold))
                    }
                    .padding(25)
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    
                    Spacer()
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.histories, id: \.self) { index in
                            
                            HStack {
                                
                                Image(index.hisPhoto ?? "")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text(index.hisTitle ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .semibold))
                                    
                                    Text(index.hisCol ?? "")
                                        .foregroundColor(.white)
                                        .font(.system(size: 12, weight: .medium))
                                        .padding(3)
                                        .padding(.horizontal, 3)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(Color("prim")))
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                            
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchHistories()
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            AddHistory(viewModel: viewModel, collectModel: CollectionsViewModel())
        })
    }
}

#Preview {
    ExhibitsView()
}
