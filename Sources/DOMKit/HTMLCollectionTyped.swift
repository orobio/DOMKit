import JavaScriptKit

public struct HTMLCollectionTyped<Element: DOMElement> {
    public let htmlCollection: HTMLCollection

    public init(_ htmlCollection: HTMLCollection, guaranteedTypeOfElements: Element.Type) {
        self.htmlCollection = htmlCollection
    }

    public var length: Int { htmlCollection.length }

    public func item(_ index: Int) -> Element? {
        htmlCollection.item(index).flatMap { $0 as? Element }
    }

    public subscript(index: Int) -> Element {
        item(index)!
    }
}

extension HTMLCollectionTyped: RandomAccessCollection {
    public var startIndex: Int { 0 }

    public var endIndex: Int { htmlCollection.endIndex }

    public func makeIterator() -> Iterator {
        Iterator(collection: self)
    }

    public struct Iterator: IteratorProtocol {
        let collection: HTMLCollectionTyped<Element>
        var index = 0

        public mutating func next() -> Element? {
            guard let element = collection.item(index) else { return nil }
            index += 1
            return element
        }
    }
}
