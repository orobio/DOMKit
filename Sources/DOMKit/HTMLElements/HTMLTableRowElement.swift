import JavaScriptKit

public class HTMLTableRowElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLTableRowElement.function!
    }
}
