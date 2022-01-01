import JavaScriptKit

public class EventTarget: Object {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.EventTarget.function!
    }
}


extension EventTarget {
    public struct ListenerHandle {
        let remover: () -> ()

        public func removeEventListener() {
            remover()
        }
    }

    private func addEventListener(_ eventType: String, _ jsClosure: JSClosure) -> ListenerHandle {
        _ = jsObject.addEventListener!(eventType, jsClosure)
        return ListenerHandle { _ = self.jsObject.removeEventListener!(eventType, jsClosure) }
    }

    private func addEventListener<EventType: Event>(_ eventType: String,
                                                    _ listener: @escaping (EventType, ListenerHandle) -> ()) -> ListenerHandle {
        var handle: ListenerHandle? = nil
        let closure = JSClosure { args in
            if args.count == 1,
               let handle = handle,
               let event = args.first?.object?.bridged(as: EventType.self) {
                listener(event, handle)
                return .undefined
            } else {
                return .undefined
            }
        }
        handle = addEventListener(eventType, closure)
        return handle!
    }

    @discardableResult
    public func addEventListener<EventType: Event>(_ eventSpec: EventSpec<EventType>,
                                                   _ listener: @escaping (EventType, ListenerHandle) -> ()) -> ListenerHandle {
        addEventListener(eventSpec.type, listener)
    }

    @discardableResult
    public func addEventListener<EventType: Event>(_ eventSpec: EventSpec<EventType>,
                                                   _ listener: @escaping (EventType) -> ()) -> ListenerHandle {
        addEventListener(eventSpec.type) { (event: EventType, _) in listener(event) }
    }

    @discardableResult
    public func addEventListener<EventType: Event>(_ eventSpec: EventSpec<EventType>,
                                                   _ listener: @escaping () -> ()) -> ListenerHandle {
        addEventListener(eventSpec.type) { _, _ in listener() }
    }

    public func dispatchEvent(_ event: Event) {
        _ = jsObject.dispatchEvent!(event.jsObject)
    }
}
