import JavaScriptKit

enum BridgedClassFactory {
    private static var factories = [(JSObject) -> Object?]()

    static func object(from jsObject: JSObject) -> Object? {
        if factories.isEmpty {
            registerBridgedClasses()
        }

        if let factoryIndex = jsObject.swiftBridgedClassFactoryIndex.number,
           factories.indices.contains(Int(factoryIndex)),
           let object = factories[Int(factoryIndex)](jsObject) {
            return object
        }

        return nil
    }

    private static func registerBridgedClass<Type: Object>(_: Type.Type) {
        factories.append { jsObject in Type(from: jsObject) }
        let index = factories.count - 1
        Type.constructor.prototype.swiftBridgedClassFactoryIndex = index.jsValue()
    }

    private static func registerBridgedClasses() {
        // General
        registerBridgedClass(Blob.self)
        registerBridgedClass(CharacterData.self)
        registerBridgedClass(CSSStyleDeclaration.self)
        registerBridgedClass(DataTransfer.self)
        registerBridgedClass(Document.self)
        registerBridgedClass(DOMElement.self)
        registerBridgedClass(DOMException.self)
        registerBridgedClass(DOMTokenList.self)
        registerBridgedClass(EventTarget.self)
        registerBridgedClass(File.self)
        registerBridgedClass(FileList.self)
        registerBridgedClass(HTMLCollection.self)
        registerBridgedClass(Node.self)
        registerBridgedClass(Object.self)
        registerBridgedClass(Performance.self)
        registerBridgedClass(Text.self)
        registerBridgedClass(Window.self)

        // HTMLElements
        registerBridgedClass(HTMLDivElement.self)
        registerBridgedClass(HTMLElement.self)
        registerBridgedClass(HTMLHeadElement.self)
        registerBridgedClass(HTMLInputElement.self)
        registerBridgedClass(HTMLLabelElement.self)
        registerBridgedClass(HTMLSpanElement.self)
        registerBridgedClass(HTMLSelectElement.self)
        registerBridgedClass(HTMLStyleElement.self)
        registerBridgedClass(HTMLTableCellElement.self)
        registerBridgedClass(HTMLTableElement.self)
        registerBridgedClass(HTMLTableRowElement.self)
        registerBridgedClass(HTMLTableSectionElement.self)

        // Events
        registerBridgedClass(DragEvent.self)
        registerBridgedClass(Event.self)
        registerBridgedClass(FocusEvent.self)
        registerBridgedClass(MouseEvent.self)
        registerBridgedClass(UIEvent.self)
    }
}
