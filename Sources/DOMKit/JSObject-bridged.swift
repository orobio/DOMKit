import JavaScriptKit

extension JSObject {
    public func bridged<Type: Object>(as _: Type.Type) -> Type? {
        if let object = BridgedClassFactory.object(from: self) as? Type {
            return object
        } else if let object = Type(from: self) {
            return object
        } else {
            return nil
        }
    }
}
