import JavaScriptKit

public class HTMLTableElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLTableElement.function!
    }
}
