import JavaScriptKit

public class HTMLDivElement: HTMLElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLDivElement.function!
    }
}
