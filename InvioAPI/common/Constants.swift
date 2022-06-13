//
//  Constants.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import UIKit

public struct Colors {
    public static let vBackground = UIColor.secondarySystemBackground
    public static let vTitle = UIColor.black
}

public struct Keys {
    public static let APP_FONT = "Helvetica"
    public static let FONT_SIZE: CGFloat = 18
}

struct Constants {
    struct Network {
        static let baseUrlPath = "https:omdbapi.com/"
        static let searchByTitlePath = "&t="
        static let apiKEY = "?apikey=92c0f909"
    }

    struct Translations {
        static let loading = "Loading"
        static let ok = "OK"
        static let cancel = "Cancel"

        struct Error {
            static let jsonDecodingError = "Error: JSON decoding error."
            static let noDataError = "Error: No data received."
            static let noResultsFound = "No results were found for your search."
            static let statusCode404 = "404 Not found"
        }
    }

    struct MovieAPI {
        static let minIdentifier = 1
        static let maxIdentifier = 1000
    }
}
