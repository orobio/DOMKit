import JavaScriptKit

public class Window: EventTarget {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Window.function!
    }
}

extension Window {
    public var innerHeight: Int {
        Int(jsObject.innerHeight.number!)
    }

    public var innerWidth: Int {
        Int(jsObject.innerWidth.number!)
    }

    public func getComputedStyle(for element: DOMElement) -> CSSStyleDeclaration {
        CSSStyleDeclaration(from: jsObject.getComputedStyle!(element))!
    }

    public func alert(_ text: String) {
        _ = jsObject.alert!(text.jsValue())
    }
}
