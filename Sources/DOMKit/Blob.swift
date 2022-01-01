import JavaScriptKit
import JavaScriptEventLoop

public class Blob: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Blob.function!
    }
}

extension Blob {
    public func text() async throws -> String {
        let promise = JSPromise(from: jsObject.text!())!
        return try await mapDOMExceptionAsync(try await promise.value.string!)
    }
}
