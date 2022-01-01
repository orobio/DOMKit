import JavaScriptKit

public class File: Blob {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.File.function!
    }
}

extension File {
    public var name: String {
        jsObject.name.string!
    }
}