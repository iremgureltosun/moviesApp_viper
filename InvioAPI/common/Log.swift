//
//  Log.swift
//  InvioAPI
//
//  Created by irem TOSUN on 2.06.2022.
//

import Foundation
import os.log

public struct Log {
    public static var general = OSLog(subsystem: "com.iremtosun.newsApp.InvioAPI", category: "general")
    public static var network = OSLog(subsystem: "com.iremtosun.newsApp.InvioAPI", category: "network")
    public static var data = OSLog(subsystem: "com.iremtosun.newsApp.InvioAPI", category: "data")
}
