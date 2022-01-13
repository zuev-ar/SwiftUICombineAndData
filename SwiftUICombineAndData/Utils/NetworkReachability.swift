//
//  NetworkReachability.swift
//  SwiftUICombineAndData
//
//  Created by Arkasha Zuev on 13.01.2022.
//

import Foundation
import SystemConfiguration

class NetworkReachability: ObservableObject {
    @Published var reachable: Bool = false
    private var reachability = SCNetworkReachabilityCreateWithName(nil, "www.designcode.io")
    
    init() {
        self.reachable = checkConnection()
    }
    
    func checkConnection() -> Bool {
        var flags = SCNetworkReachabilityFlags()
        SCNetworkReachabilityGetFlags(reachability!, &flags)
        
        return isNetworkReachable(with: flags)
    }
    
    private func isNetworkReachable(with flags: SCNetworkReachabilityFlags) -> Bool {
        let isReachable = flags.contains(.reachable)
        let connectionRequired = flags.contains(.connectionRequired)
        let canConnectAutomatically = flags.contains(.connectionOnDemand) || flags.contains(.connectionOnTraffic)
        let canConnectWithoutIntervention = canConnectAutomatically && !flags.contains(.interventionRequired)
        
        return isReachable && (!connectionRequired || canConnectWithoutIntervention)
    }
}
