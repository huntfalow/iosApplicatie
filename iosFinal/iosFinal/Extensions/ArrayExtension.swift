//
//  ArrayExtension.swift
//  iosFinal
//
//  Created by Vincent on 30/08/2020.
//  Copyright © 2020 Vincent. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: Equatable {
    func removing(_ obj: Element) -> [Element] {
        return filter { $0 != obj }
    }
}
