//
//  ContentView.swift
//  DesaturationApp
//
//  Created by Andrew Wolfsky on 13.10.2023.
//

import SwiftUI

struct ContentView: View {
  @State private var desaturation: Double = 1.0
  
    var body: some View {
      VStack {
        HStack(spacing: 16) {
          Image("win")
            .resizable()
            .aspectRatio(contentMode: .fit)
          Image(uiImage: ImageProcessor
            .desaturate(image: UIImage(imageLiteralResourceName: "win"),
                        desaturation: desaturation) ?? UIImage())
          .resizable()
          .aspectRatio(contentMode: .fit)
          
        }
        HStack {
          Image("ber")
            .resizable()
            .aspectRatio(contentMode: .fit)
          Image(uiImage: ImageProcessor
            .desaturate(image: UIImage(imageLiteralResourceName: "ber"),
                        desaturation: desaturation) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
        HStack {
          Image("waterm")
            .resizable()
            .aspectRatio(contentMode: .fit)
          Image(uiImage: ImageProcessor
            .desaturate(image: UIImage(imageLiteralResourceName: "waterm"),
                        desaturation: desaturation) ?? UIImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
        Slider(value: $desaturation, in: 0.0...1.0)
        Text("Desaturation \((desaturation * 100), specifier: "%.0f") percent")
      }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
