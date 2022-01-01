import JavaScriptKit

public class Text: CharacterData {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.Text.function!
    }
}
