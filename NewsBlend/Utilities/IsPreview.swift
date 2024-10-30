//
//  IsPreview.swift
//  NewsBlend
//
//  Created by Abdullah Jaswal on 4/10/2024.
//

import Foundation

func isRunningInPreview() -> Bool {
    ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
