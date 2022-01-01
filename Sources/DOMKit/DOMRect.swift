import JavaScriptKit

public class DOMRect: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.DOMRect.function!
    }
}

extension DOMRect {
    public var height: Double {
        jsObject.height.number!
    }
}
