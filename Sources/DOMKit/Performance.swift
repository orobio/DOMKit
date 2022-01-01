import JavaScriptKit

public class Performance: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Performance.function!
    }
}

extension Performance {
    public func now() -> Double {
        jsObject.now!().number!
    }
}
