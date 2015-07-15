//
//  LicensingItem.swift
//  LicensingViewController
//
//  Created by Tiago Henriques on 07/07/15.
//

import Foundation

public struct LicensingItem {

    let title: String
    let license: License

    public init(title: String, license: License) {
        self.title = title
        self.license = license
    }

    func notice() -> String {
        return license.notice()
    }
    
}
