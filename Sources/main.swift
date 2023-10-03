import Foundation
import Carbon

// 現在のInputSourceを取得
let currSrc = TISCopyCurrentKeyboardInputSource().takeUnretainedValue()
let currID = Unmanaged<AnyObject>.fromOpaque(TISGetInputSourceProperty(currSrc, kTISPropertyInputSourceID)).takeUnretainedValue() as! String

// 引数で指定がない場合は現在のIDを返却
if CommandLine.arguments.count <= 1 {
    print(currID)
    exit(0)
}

// 変更の必要がない場合は何もしない
let nextID = CommandLine.arguments[1]
if currID == nextID {
    print(nextID)
    exit(0)
}

// InputSourceを変更
let filter = [
    kTISPropertyInputSourceID: nextID,
] as CFDictionary
if let list = TISCreateInputSourceList(filter, false)?.takeUnretainedValue() {
    let nextSrc = Unmanaged<TISInputSource>.fromOpaque(CFArrayGetValueAtIndex(list, 0)).takeUnretainedValue()
    TISSelectInputSource(nextSrc)
    print(nextID)
    exit(0)
} else {
    exit(1)
}
