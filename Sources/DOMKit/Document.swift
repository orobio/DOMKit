import JavaScriptKit

public class Document: Node {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Document.function!
    }
}

extension Document {
    public var head: HTMLHeadElement {
        HTMLHeadElement(from: jsObject.head)!
    }

    public func getElementBy(id: String) -> DOMElement? {
        jsObject.getElementById!(id).object?.bridged(as: DOMElement.self)
    }

    public func createElement(_ tagName: String) -> DOMElement {
        jsObject.createElement!(tagName).object!.bridged(as: DOMElement.self)!
    }

    public func createElement<Type: HTMLElement>(_ tagSpec: HTMLTagSpec<Type>) -> Type {
        createElement(tagSpec.tagName) as! Type
    }

    public func createTextNode(_ text: String) -> Text {
        Text(from: jsObject.createTextNode!(text))!
    }
}
