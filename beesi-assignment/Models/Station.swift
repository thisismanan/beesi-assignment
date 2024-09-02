//
//  Station.swift
//  beesi-assignment
//
//  Created by Manan Bhatia on 31/08/24.
//

import Foundation

struct Station {
    let code: String
    let name: String
    let distance: String
    let timings: String
    let platform: String
    let additionalInfo: additionalStationInfo?
    let isTrainDelayed: Bool?
    
    init(code: String, name: String, distance: String, timings: String, platform: String, additionalInfo: additionalStationInfo? = nil, isTrainDelayed: Bool? = false) {
        self.code = code
        self.name = name
        self.distance = distance
        self.timings = timings
        self.platform = platform
        self.additionalInfo = additionalInfo
        self.isTrainDelayed = isTrainDelayed
    }
}

enum additionalStationInfo {
    case orderFoodOnline
}

struct Header {
    let title: String
    let subtitle: String
    let buttonText: String
}


let stationMockData = [
    Station(code: "INDB", name: "INDORE JN BG", distance: "0 Km", timings: "Start at 17:55", platform: "PF #3"),
    Station(code: "DWX", name: "DEWAS", distance: "39 Km", timings: "18:21 -> 18:23", platform: "PF #2", isTrainDelayed: true),
    Station(code: "UJN", name: "UJJAIN JN", distance: "80 Km", timings: "19:15 -> 19:20", platform: "PF #4", additionalInfo: additionalStationInfo.orderFoodOnline),
    Station(code: "NAD", name: "NAGDA JN", distance: "135 Km", timings: "20:18 -> 20:23", platform: "PF #2", additionalInfo: additionalStationInfo.orderFoodOnline),
    Station(code: "KUC", name: "KHACHROD", distance: "148 Km", timings: "20:34 -> 20:36", platform: "PF #1"),
    Station(code: "INDB", name: "INDORE JN BG", distance: "0 Km", timings: "Start at 17:55", platform: "PF #3"),
    Station(code: "DWX", name: "DEWAS", distance: "39 Km", timings: "18:21 -> 18:23", platform: "PF #2"),
    Station(code: "UJN", name: "UJJAIN JN", distance: "80 Km", timings: "19:15 -> 19:20", platform: "PF #4"),
    Station(code: "NAD", name: "NAGDA JN", distance: "135 Km", timings: "20:18 -> 20:23", platform: "PF #2", additionalInfo: additionalStationInfo.orderFoodOnline),
    Station(code: "KUC", name: "KHACHROD", distance: "148 Km", timings: "20:34 -> 20:36", platform: "PF #1"),

]

let headerMockData = Header(title: "Train starts at 17:55", subtitle: "Train hasn't started yet. But all looks good", buttonText: "Refresh")
