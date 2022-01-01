import JavaScriptKit

public class CharacterData: Node {
    public override class func getConstructor() -> JSFunction {
        JSObject.global.CharacterData.function!
    }
}
