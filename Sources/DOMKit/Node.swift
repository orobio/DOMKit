import JavaScriptKit

public class Node: EventTarget {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Node.function!
    }
}

extension Node {
    public var nodeName: String { jsObject.nodeName.string! }

    public var parentElement: DOMElement? {
        jsObject.parentElement.object?.bridged(as: DOMElement.self)
    }

    public var firstChild: Node? {
        jsObject.firstChild.object?.bridged(as: Node.self)
    }

    public var lastChild: Node? {
        jsObject.lastChild.object?.bridged(as: Node.self)
    }

    @discardableResult
    public func appendChild(_ child: Node) throws -> Node {
        try mapDOMException(jsObject.throwing.appendChild!(child.jsObject).object!.bridged(as: Node.self)!)
    }

    @discardableResult
    public func removeChild(_ child: Node) throws -> Node {
        try mapDOMException(jsObject.throwing.removeChild!(child.jsObject).object!.bridged(as: Node.self)!)
    }

    @discardableResult
    public func insert(_ child: Node, before referenceNode: Node) throws -> Node {
        try mapDOMException(jsObject.throwing.insertBefore!(child.jsObject, referenceNode.jsObject).object!.bridged(as: Node.self)!)
    }
}
