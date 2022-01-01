import JavaScriptKit

public class HTMLInputElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLInputElement.function!
    }
}

extension HTMLInputElement {
    public var files: FileList? {
        return FileList(from: jsObject.files)
    }
}
