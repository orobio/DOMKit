import JavaScriptKit

public class FocusEvent: UIEvent {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.FocusEvent.function!
    }
}
