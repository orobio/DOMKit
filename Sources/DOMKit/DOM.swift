import JavaScriptKit

public enum DOM {
    public static let document = Document(from: JSObject.global.document)!
    public static let window = Window(from: JSObject.global.window)!
    public static let performance = Performance(from: JSObject.global.performance)!

    private static let _setTimeout = JSObject.global.setTimeout.function!
    public static func setTimeout(milliseconds delay: Int, f: @escaping () -> ()) {
        _setTimeout(JSOneshotClosure { _ in
            f()
            return JSValue.undefined
        }, delay)
    }
}
