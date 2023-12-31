import JavaScriptKit

public class HTMLSelectElement: HTMLElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLSelectElement.function!
    }
}

extension HTMLSelectElement {
    public var value: String {
        get {
            jsObject.value.string!
        }
        set {
            jsObject.value = newValue.jsValue
        }
    }
}