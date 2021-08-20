//
//  ImageExtension.swift
//  iosFinal
//
//  Created by Vincent on 30/08/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func load(urlString : String) {
        guard let url = URL(string: urlString)else {
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
