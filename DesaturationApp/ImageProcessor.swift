//
//  ImageProcessor.swift
//  DesaturationApp
//
//  Created by Andrew Wolfsky on 13.10.2023.
//

import UIKit

struct ImageProcessor {
  static func desaturate(image: UIImage, desaturation value: Double) -> UIImage? {
    guard let input = CIImage(image: image) else { print("Invalid input image"); return nil }
 
    let desFilter = input.applyingFilter("CIColorControls", parameters: ["inputSaturation": value])
    
    let overlayRgba: [CGFloat] = [0, 0, 0, 0.4]
    let alphaVector: CIVector = CIVector(values: overlayRgba, count: 4)
    
    let resultImage: CIImage = desFilter.applyingFilter("CIColorMatrix", parameters: ["inputAVector": alphaVector])

    if let cgImage = CIContext().createCGImage(resultImage, from: resultImage.extent) {
      return UIImage(cgImage: cgImage)
    } else {
      return nil
    }
  }
}
