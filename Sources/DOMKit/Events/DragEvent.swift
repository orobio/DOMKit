import JavaScriptKit

public class DragEvent: MouseEvent {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.DragEvent.function!
    }
}

extension DragEvent {
    public var dataTransfer: DataTransfer {
        DataTransfer(from: jsObject.dataTransfer)!
    }
}