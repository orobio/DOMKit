import JavaScriptKit

public class Event: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Event.function!
    }

    public convenience init(type: String) {
        self.init(unsafelyWrapping: Self.getConstructor().new(type))
    }
}

extension Event {
    public var type: String {
        jsObject.type.string!
    }

    public var target: EventTarget {
        jsObject.target.object!.bridged(as: EventTarget.self)!
    }

    public var currentTarget: EventTarget {
        jsObject.currentTarget.object!.bridged(as: EventTarget.self)!
    }
}
