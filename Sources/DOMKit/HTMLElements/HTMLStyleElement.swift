import JavaScriptKit

public class HTMLStyleElement: HTMLElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLStyleElement.function!
    }
}
