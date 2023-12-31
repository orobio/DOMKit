import JavaScriptKit

public class DataTransfer: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.DataTransfer.function!
    }
}

extension DataTransfer {
    public func setData(_ format: String, _ data: String) {
        _ = jsObject.setData!(format.jsValue, data.jsValue)
    }

    public func getData(_ format: String) -> String {
        jsObject.getData!(format).string!
    }
}