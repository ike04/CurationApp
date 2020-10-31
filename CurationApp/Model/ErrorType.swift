//
//  ErrorType.swift
//  CurationApp
//
//  Created by 池田一成 on 2020/08/22.
//  Copyright © 2020 池田一成. All rights reserved.
//

import Foundation

enum UIErrorType: Error {
    case empty
    case count
    case notMatchPassword
    case emailValid
    case emptyUrl

    var message: String {
        switch self {
        case .empty:
            return R.string.localizable.empty()
        case .count:
            return R.string.localizable.minmum()
        case .notMatchPassword:
            return R.string.localizable.notMatchPassword()
        case .emailValid:
            return R.string.localizable.emailValid()
        case .emptyUrl:
            return R.string.localizable.emptyUrl()
        }
    }
}
