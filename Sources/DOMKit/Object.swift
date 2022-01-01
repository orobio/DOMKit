import JavaScriptKit

public class Object: JSBridgedClass {
    public let jsObject: JSObject

    public static var constructor: JSFunction { Self.getConstructor() }

    public class func getConstructor() -> JSFunction {
        JSObject.global.Object.function!
    }

    public required init(unsafelyWrapping jsObject: JSObject) {
        self.jsObject = jsObject
    }
}
