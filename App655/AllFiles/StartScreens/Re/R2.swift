//
//  R2.swift
//  App655
//
//  Created by IGOR on 27/06/2024.
//

import SwiftUI

struct R2: View {
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                Image("R2")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Text("Ease of editing at all stages")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top, 80)
                
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: {
                        
                        R3()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Next")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                    })
                    .padding()
                    
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity)
                .frame(height: 130)
                .background(Color.white)
                .shadow(color: .white, radius: 10)
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    R2()
}
