import JavaScriptKit

public class HTMLTableSectionElement: HTMLElement {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.HTMLTableSectionElement.function!
    }
}

extension HTMLTableSectionElement {
    public var rows: HTMLCollectionTyped<HTMLTableRowElement> {
        HTMLCollectionTyped(HTMLCollection(from: jsObject.rows)!, guaranteedTypeOfElements: HTMLTableRowElement.self)
    }
}
