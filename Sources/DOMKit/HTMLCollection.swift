import JavaScriptKit

public class HTMLCollection: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLCollection.function!
    }
}

extension HTMLCollection {
    public var length: Int {
        Int(jsObject.length.number!)
    }

    public func item(_ index: Int) -> DOMElement? {
        jsObject.item!(index).object?.bridged(as: DOMElement.self)
    }

    public subscript(index: Int) -> DOMElement {
        item(index)!
    }
}

extension HTMLCollection: RandomAccessCollection {
    public var startIndex: Int { 0 }

    public var endIndex: Int { length }

    public func makeIterator() -> Iterator {
        Iterator(collection: self)
    }

    public struct Iterator: IteratorProtocol {
        let collection: HTMLCollection
        var index = 0

        public mutating func next() -> DOMElement? {
            guard let element = collection.item(index) else { return nil }
            index += 1
            return element
        }
    }
}
