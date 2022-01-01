public struct EventSpec<Type: Event> {
    let type: String
}

extension EventSpec {
    public static var mouseDown     : EventSpec<MouseEvent>         { .init(type: "mousedown")     }
    public static var mouseEnter    : EventSpec<MouseEvent>         { .init(type: "mouseenter")    }
    public static var mouseLeave    : EventSpec<MouseEvent>         { .init(type: "mouseleave")    }
    public static var mouseMove     : EventSpec<MouseEvent>         { .init(type: "mousemove")     }
    public static var mouseUp       : EventSpec<MouseEvent>         { .init(type: "mouseup")       }

    public static var resize        : EventSpec<Event>              { .init(type: "resize")        }
}
