import JavaScriptKit

public class DOMTokenList: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.DOMTokenList.function!
    }
}

extension DOMTokenList {
    public var length: Int {
        Int(jsObject.length.number!)
    }

    public func item(_ index: Int) -> String? {
        let element = jsObject.item!(index)
        if element.isNull {
            return nil
        } else {
            return element.string!
        }
    }

    public subscript(index: Int) -> String {
        item(index)!
    }

    public func add(_ token: String) {
        _ = jsObject.add!(token)
    }

    public func remove(_ token: String) {
        _ = jsObject.remove!(token)
    }
}

extension DOMTokenList: RandomAccessCollection {
    public var startIndex: Int { 0 }

    public var endIndex: Int { length }

    public func makeIterator() -> Iterator {
        Iterator(tokenList: self)
    }

    public struct Iterator: IteratorProtocol {
        let tokenList: DOMTokenList
        var index = 0

        public mutating func next() -> String? {
            guard let token = tokenList.item(index) else { return nil }
            index += 1
            return token
        }
    }
}
