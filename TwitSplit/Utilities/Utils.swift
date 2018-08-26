//
//  Split.swift
//  TwitSplit
//
//  Created by user on 25/8/18.
//  Copyright © 2018 user. All rights reserved.
//

import Foundation
class Utils {
    static func splitMessage(message: String, limit: Int) -> [String] {
        let input = message.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let regex = try! NSRegularExpression(pattern: "(.{1,\(limit-4)})(\\s+|$|\n+)")
        var results = [String]()
        let range = NSRange(input.startIndex..., in: message)
        let split = regex.matches(in: input, options: .anchored, range: range)
        if  split.count == 0 && !input.isEmpty
        {
            return [String]();
        }
        else if  split.count == 1
        {
            results.append(input)
            return results;
        }
        var index = 0;
        for match in regex.matches(in: input, options: .anchored, range: range) {
            index = index + 1
            let range = Range(match.range(at: 1), in: message)!
            results.append("\(index)/\(split.count) " + message[range])
        }
        return  results
    }
    
}


