import JavaScriptKit

public class DOMElement: Node {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Element.function!
    }
}

extension DOMElement {
    public var tagName: String {
        jsObject.tagName.string!
    }

    public var clientHeight: Int {
        Int(jsObject.clientHeight.number!)
    }

    public var children: HTMLCollection {
        HTMLCollection(from: jsObject.children)!
    }

    public var firstElementChild: DOMElement? {
        jsObject.firstElementChild.object?.bridged(as: DOMElement.self)
    }

    public var lastElementChild: DOMElement? {
        jsObject.lastElementChild.object?.bridged(as: DOMElement.self)
    }

    public var nextElementSibling: DOMElement? {
        jsObject.nextElementSibling.object?.bridged(as: DOMElement.self)
    }

    public var previousElementSibling: DOMElement? {
        jsObject.previousElementSibling.object?.bridged(as: DOMElement.self)
    }

    public var innerHTML: String {
        get {
            jsObject.innerHTML.string!
        }
        set {
            jsObject.innerHTML = newValue.jsValue()
        }
    }

    public var classList: DOMTokenList {
        DOMTokenList(from: jsObject.classList)!
    }

    public var scrollTop: Int {
        get {
            Int(jsObject.scrollTop.number!)
        }
        set {
            jsObject.scrollTop = newValue.jsValue()
        }
    }

    public func hasAttribute(_ name: String) -> Bool {
        jsObject.hasAttribute!(name).boolean!
    }

    public func setAttribute(_ name: String, to value: String) {
        _ = jsObject.setAttribute!(name, value)
    }

    public func getAttribute(_ name: String) -> String? {
        if hasAttribute(name) {
            return jsObject.getAttribute!(name).string!
        } else {
            return nil
        }
    }

    public func getElementsBy(tagName: String) -> HTMLCollection {
        HTMLCollection(from: jsObject.getElementsByTagName!(tagName))!
    }

    public func getElementsBy<Type: HTMLElement>(tagName tagSpec: HTMLTagSpec<Type>) -> HTMLCollectionTyped<Type> {
        HTMLCollectionTyped(getElementsBy(tagName: tagSpec.tagName), guaranteedTypeOfElements: Type.self)
    }

    public func getElementsBy(className: String) -> HTMLCollection {
        HTMLCollection(from: jsObject.getElementsByClassName!(className))!
    }

    public func getBoundingClientRect() -> DOMRect {
        DOMRect(from: jsObject.getBoundingClientRect!())!
    }
}
