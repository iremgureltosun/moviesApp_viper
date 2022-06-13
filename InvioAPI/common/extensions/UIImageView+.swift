//
//  UIImageView+.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import UIKit

extension UIImageView {
    func loadFrom(urlPath: String) {
        guard let url = URL(string: urlPath) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
