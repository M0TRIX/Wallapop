//
//  Domain.swift
//  HomeTask
//
//  Created by Ali Asadi on 3/6/1401 AP.
//

import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

class Domain{
    
    var address = "http://gateway.marvel.com/"
    var subAddress = "v1/public/"
    var public_key = "3fd2f49ed647cb7d5649fb341e35cffc"
    var private_key = "e29bb1ec39abee023f2fc836b946dc56de208511"
    var ts = "1"
    
    func getDomain()->String{
        return address
    }
    
    func getsubDomain()->String{
        return subAddress
    }
    
    func getHash()->String{
        
        return getmd5Of(ts + private_key + public_key)
    }
    
    func getFullDomain()->String{
        return address + subAddress
    }
    
    func getmd5Of(_ string: String) -> String {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        let md5Hex =  digestData.map { String(format: "%02hhx", $0) }.joined()
        return md5Hex
    }
}
