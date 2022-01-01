import JavaScriptKit

public class MouseEvent: UIEvent {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.MouseEvent.function!
    }
}

extension MouseEvent {
    public var clientX: Double {
        Double(jsObject.clientX.number!)
    }

    public var clientY: Double {
        Double(jsObject.clientY.number!)
    }
}
