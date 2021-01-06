//
//  LandingPage.swift
//  Holidario
//
//  Created by Tadreik Campbell on 1/6/21.
//

import SwiftUI

struct LandingPage: View {
    var body: some View {
        VStack {
            HStack {
                Text("Holidario")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }.padding()
            
            Button("4th of July", action: {})
                .frame(width: UIScreen.main.bounds.width / 1.2, height: 44, alignment: .center)
                .font(.title)
                .foregroundColor(.white)
                .padding(8)
                .background(Color(.blue))
                .cornerRadius(20)
            Spacer()
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
