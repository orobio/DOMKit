import JavaScriptKit

public class HTMLElement: DOMElement {
     public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLElement.function!
    }
}

extension HTMLElement {
    public var offsetLeft  : Int {
        Int(jsObject.offsetLeft.number!)
    }

    public var offsetTop   : Int {
        Int(jsObject.offsetTop.number!)
    }

    public var offsetHeight: Int {
        Int(jsObject.offsetHeight.number!)
    }

    public var style: CSSStyleDeclaration {
        CSSStyleDeclaration(from: jsObject.style)!
    }

    public func focus() {
        _ = jsObject.focus!()
    }
}
