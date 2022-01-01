import JavaScriptKit

public class UIEvent: Event {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.UIEvent.function!
    }
}
