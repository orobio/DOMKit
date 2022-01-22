import JavaScriptKit

public class HTMLLabelElement: HTMLElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLLabelElement.function!
    }
}
