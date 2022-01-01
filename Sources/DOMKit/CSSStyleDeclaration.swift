import JavaScriptKit

public class CSSStyleDeclaration: EventTarget {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.CSSStyleDeclaration.function!
    }
}

extension CSSStyleDeclaration {
    public var length: Int {
        Int(jsObject.length.number!)
    }

    public func item(_ index: Int) -> (key: String, value: String)? {
        if let key = jsObject.item!(index).string,
           key != "",
           let value = self[key] {
            return (key: key, value: value)
        } else {
            return nil
        }
    }

    public subscript(index: Int) -> (key: String, value: String) {
        item(index)!
    }

    public subscript(key: String) -> String? {
        get {
            if let value = jsObject.getPropertyValue!(key.jsValue()).string,
               value != "" {
                return value
            } else {
                return nil
            }
        }
        set {
            _ = jsObject.setProperty!(key.jsValue(), newValue.jsValue())
        }
    }
}

extension CSSStyleDeclaration: RandomAccessCollection {
    public var startIndex: Int { 0 }

    public var endIndex: Int { length }

    public func makeIterator() -> Iterator {
        Iterator(cssStyleDeclaration: self)
    }

    public struct Iterator: IteratorProtocol {
        let cssStyleDeclaration: CSSStyleDeclaration
        var index = 0

        public mutating func next() -> (key: String, value: String)? {
            guard let keyValue = cssStyleDeclaration.item(index) else { return nil }
            index += 1
            return keyValue
        }
    }
}
