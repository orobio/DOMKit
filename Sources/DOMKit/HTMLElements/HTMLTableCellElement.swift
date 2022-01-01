import JavaScriptKit

public class HTMLTableCellElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLTableCellElement.function!
    }
}
