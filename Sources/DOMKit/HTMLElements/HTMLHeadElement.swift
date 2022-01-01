import JavaScriptKit

public class HTMLHeadElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLHeadElement.function!
    }
}
