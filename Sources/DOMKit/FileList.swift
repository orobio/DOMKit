import JavaScriptKit

public class FileList: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.FileList.function!
    }
}

extension FileList {
    public var length: Int {
        Int(jsObject.length.number!)
    }

    public func item(_ index: Int) -> File? {
        let element = jsObject.item!(index)
        if element.isNull {
            return nil
        } else {
            return File(from: element)!
        }
    }

    public subscript(index: Int) -> File {
        item(index)!
    }
}

extension FileList: RandomAccessCollection {
    public var startIndex: Int { 0 }

    public var endIndex: Int { length }

    public func makeIterator() -> Iterator {
        Iterator(fileList: self)
    }

    public struct Iterator: IteratorProtocol {
        let fileList: FileList
        var index = 0

        public mutating func next() -> File? {
            guard let file = fileList.item(index) else { return nil }
            index += 1
            return file
        }
    }
}
