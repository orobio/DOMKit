import JavaScriptKit

public class HTMLSpanElement: HTMLElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLSpanElement.function!
    }
}
