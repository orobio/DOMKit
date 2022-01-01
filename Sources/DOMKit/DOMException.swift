import JavaScriptKit

class DOMException: Object, Error {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.DOMException.function!
    }
}

func mapDOMException<R>(_ f: @autoclosure () throws -> R) throws -> R {
    do {
        return try f()
    } catch let error as JSValue {
        if let domException = DOMException(from: error) {
            throw domException
        } else {
            throw error
        }
    } catch {
        throw error
    }
}

func mapDOMExceptionAsync<R>(_ f: @autoclosure () async throws -> R) async throws -> R {
    do {
        return try await f()
    } catch let error as JSValue {
        if let domException = DOMException(from: error) {
            throw domException
        } else {
            throw error
        }
    } catch {
        throw error
    }
}
