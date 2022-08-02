//
//  NetworkManager.swift
//
//
//  Created by yugo.sugiyama on 2022/07/31.
//

import Foundation
import Alamofire
import SwiftHomeCredentials

public enum SwitchBotParameter: Encodable {
    case `default`
    case custom(parameter: String)

    var parameter: String {
        switch self {
        case .default:
            return "default"
        case .custom(let parameter):
            return parameter
        }
    }
}

public struct SwitchBotRequest: Encodable {
    public let command: String
    public let parameter: SwitchBotParameter
    public let commandType = "command"

    public init(parameter: SwitchBotParameter, command: String) {
        self.parameter = parameter
        self.command = command
    }
}

public extension NetworkType.SwitchBotType {
    var parameter: SwitchBotRequest {
        switch self {
        case .curtain(let close):
            let parameter = "0,ff,\(close ? "100" : "0")"
            return SwitchBotRequest(parameter: .custom(parameter: parameter), command: "setPosition")
        case .plugSwitch(let enable):
            return SwitchBotRequest(parameter: .default, command: enable ? "turnOn" : "turnOff")
        }
    }
}

public class NetworkManager {
    public static let shared = NetworkManager()
    private init() {}

    public func send(type: NetworkType) {

    }
}

